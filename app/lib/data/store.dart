// Nákupy balíčků (§13): non-consumable IAP přes StoreKit 2 / Play Billing.
// Zdroj pravdy je store; odemčené balíčky se cachují v user.db (AppState.grant),
// takže appka funguje offline. Síť je potřeba jen pro nákup a obnovení.
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';

import 'content.dart';

/// „Vše“ odemkne všechny balíčky. V content.db není, je to jen produkt ve storu.
const allPack = 'all';
const allProduct = 'com.ol1n.papanek.pack.all';

class Shop extends ChangeNotifier {
  Shop(this._packs, this._grant);

  final List<Pack> _packs;
  final Future<void> Function(String packId) _grant;
  final _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _sub;

  bool available = false;
  bool loading = true;
  final products = <String, ProductDetails>{}; // pack id → produkt
  final pending = <String>{}; // pack id, u kterých běží nákup
  String? error; // poslední chyba pro snackbar, UI ji po zobrazení smaže
  final _flows = <String, TelemetryFlow>{}; // pack id → purchase flow (anonymous statistics)

  void _endFlow(String? pack, String result) {
    if (pack != null) _flows.remove(pack)?.end(result);
  }

  /// pack id → product id pro aktuální platformu
  late final Map<String, String> _ids = {
    for (final p in _packs)
      if (!p.free && (Platform.isIOS ? p.productIos : p.productAndroid) != null)
        p.id: (Platform.isIOS ? p.productIos : p.productAndroid)!,
    allPack: allProduct,
  };

  String? _packOf(String productId) {
    for (final e in _ids.entries) {
      if (e.value == productId) return e.key;
    }
    return null;
  }

  Future<void> init() async {
    // Stream poslouchat hned: StoreKit doručí nedokončené transakce po startu.
    _sub = _iap.purchaseStream.listen(
      _onPurchases,
      onError: (Object e) {
        error = '$e';
        notifyListeners();
      },
    );
    try {
      available = await _iap.isAvailable();
      if (available) {
        final r = await _iap.queryProductDetails(_ids.values.toSet());
        for (final p in r.productDetails) {
          final pack = _packOf(p.id);
          if (pack != null) products[pack] = p;
        }
        if (r.notFoundIDs.isNotEmpty) debugPrint('IAP: produkty nenalezeny: ${r.notFoundIDs}');
      }
    } catch (e) {
      available = false;
      debugPrint('IAP: $e');
    }
    loading = false;
    notifyListeners();
  }

  Future<void> buy(String packId) async {
    final p = products[packId];
    if (p == null) return;
    pending.add(packId);
    notifyListeners();
    _endFlow(packId, 'cancel');
    _flows[packId] = Telemetry.flow('purchase', {'target': packId == allPack ? 'all' : 'pack'});
    try {
      await _iap.buyNonConsumable(purchaseParam: PurchaseParam(productDetails: p));
    } catch (e) {
      _endFlow(packId, 'error');
      pending.remove(packId);
      error = '$e';
      notifyListeners();
    }
  }

  Future<void> restore() => _iap.restorePurchases();

  Future<void> _onPurchases(List<PurchaseDetails> list) async {
    for (final d in list) {
      final pack = _packOf(d.productID);
      switch (d.status) {
        case PurchaseStatus.pending:
          if (pack != null) pending.add(pack);
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          // Bez serveru neověřujeme účtenku; spoléháme na StoreKit 2 / Play (§13).
          if (pack != null) await _grant(pack);
          if (pack != null) pending.remove(pack);
          _endFlow(pack, d.status == PurchaseStatus.purchased ? 'ok' : 'restored');
        case PurchaseStatus.error:
          error = d.error?.message ?? 'error';
          if (pack != null) pending.remove(pack);
          _endFlow(pack, 'error');
        case PurchaseStatus.canceled:
          if (pack != null) pending.remove(pack);
          _endFlow(pack, 'cancel');
      }
      if (d.pendingCompletePurchase) await _iap.completePurchase(d);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
