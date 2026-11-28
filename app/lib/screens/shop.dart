import 'package:flutter/material.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';

import '../data/app_state.dart';
import '../data/content.dart';
import '../data/store.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';

/// Kuchyně / Obchod (§12.6): balíčky s počtem receptů a cenou, „Vše“, „Obnovit nákupy“.
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});
  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final s = Scope.of(context);
    final shop = s.shop;
    final err = shop?.error;
    if (err != null) {
      shop!.error = null;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Telemetry.errorShown('purchase');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.purchaseFailed(err))));
      });
    }
    final paid = s.content.packs.where((p) => !p.free).toList();
    final ownsAll = s.owned.contains(allPack) || paid.every((p) => s.owned.contains(p.id));
    return Scaffold(
      appBar: AppBar(
        title: Text(l.tabShop),
        actions: [
          if (shop != null && shop.available)
            TextButton(
              onPressed: () {
                shop.restore();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.restoreStarted)));
              },
              child: Text(l.restorePurchases),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (shop == null || (!shop.loading && !shop.available))
            _Banner(l.storeUnavailable)
          else if (shop.loading)
            _Banner(l.storeLoading),
          if (!ownsAll && shop?.products[allPack] != null) ...[
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(Icons.all_inclusive, size: 32),
                title: Text(l.allPacksTitle, style: Theme.of(context).textTheme.titleLarge),
                subtitle: Text(l.allPacksBody),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 8, bottom: 16), child: _BuyButton(allPack, owned: false)),
          ],
          for (final p in paid) ...[_PackTile(p, owned: s.ownsPack(p.id)), const SizedBox(height: 12)],
        ],
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(padding: const EdgeInsets.all(16), child: Text(text)),
    ),
  );
}

class _PackTile extends StatelessWidget {
  const _PackTile(this.pack, {required this.owned});
  final Pack pack;
  final bool owned;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final s = Scope.of(context);
    final t = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pack.name(s.lang), style: t.titleMedium),
                  const SizedBox(height: 4),
                  Text(l.recipeCount(s.content.recipeCount(pack.id)), style: t.bodySmall),
                ],
              ),
            ),
            _BuyButton(pack.id, owned: owned),
          ],
        ),
      ),
    );
  }
}

class _BuyButton extends StatelessWidget {
  const _BuyButton(this.packId, {required this.owned});
  final String packId;
  final bool owned;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final shop = Scope.of(context).shop;
    if (owned) {
      return Chip(
        avatar: Icon(Icons.check_circle, color: Colors.green.shade600),
        label: Text(l.unlockedLabel),
      );
    }
    if (shop != null && shop.pending.contains(packId)) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)),
          const SizedBox(width: 8),
          Text(l.purchasePending),
        ],
      );
    }
    final product = shop?.products[packId];
    if (product == null) return Text(l.notForSale, style: Theme.of(context).textTheme.bodySmall);
    return FilledButton(onPressed: () => shop!.buy(packId), child: Text(l.buy(product.price)));
  }
}

/// Otevře obchod jako samostatnou stránku (ze zamčeného receptu).
void openShop(BuildContext context) {
  final s = Scope.of(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      settings: const RouteSettings(name: '/shop'),
      builder: (_) => const ShopScreen(),
    ),
  );
  reportShopShown(s); // after the push, so the error counts on the shop screen
}

/// The shop came into view: report the "store unavailable" banner if it shows.
void reportShopShown(AppState s) {
  final shop = s.shop;
  if (shop == null || (!shop.loading && !shop.available)) Telemetry.errorShown('store_unavailable');
}
