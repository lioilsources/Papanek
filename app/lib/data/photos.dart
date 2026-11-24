// Fotky obsahu (assets/photos): jídlo, krok postupu, surovina, nástroj. Vyrábí je
// papanek-enrich photos na L40S; které existují, se zjistí jednou z AssetManifestu,
// aby se nevykreslovalo prázdné místo.
import 'package:flutter/services.dart';

class Photos {
  Photos(this._have);
  Photos.none() : _have = const {};
  final Set<String> _have;

  static Future<Photos> load() async {
    try {
      final m = await AssetManifest.loadFromAssetBundle(rootBundle);
      return Photos(m.listAssets().where((a) => a.startsWith('assets/photos/')).toSet());
    } catch (_) {
      return Photos.none();
    }
  }

  String? _get(String p) => _have.contains(p) ? p : null;
  String? hero(String slug) => _get('assets/photos/hero/$slug.webp');
  String? step(String slug, int i) => _get('assets/photos/step/${slug}_${(i + 1).toString().padLeft(2, '0')}.webp');
  String? ingredient(String slug) => _get('assets/photos/ing/$slug.webp');
  String? tool(String slug) => _get('assets/photos/tool/$slug.webp');
}
