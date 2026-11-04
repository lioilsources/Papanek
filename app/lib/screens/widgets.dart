import 'package:flutter/material.dart';

import '../data/content.dart';
import '../l10n/app_localizations.dart';

/// Hero obrázek receptu; bez obrázku barevná plocha s ikonou kuchyně.
class RecipeImage extends StatelessWidget {
  const RecipeImage(this.recipe, {super.key, this.height});
  final Recipe recipe;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    if (recipe.image != null) {
      return Image.asset('assets/images/${recipe.image}', height: height, width: double.infinity, fit: BoxFit.cover);
    }
    return Container(
      height: height,
      width: double.infinity,
      color: c.primaryContainer,
      child: Icon(Icons.ramen_dining, size: 48, color: c.onPrimaryContainer),
    );
  }
}

String formatQty(double q) {
  const frac = {'0.25': '¼', '0.50': '½', '0.75': '¾', '0.33': '⅓', '0.67': '⅔'};
  final whole = q.floor();
  final f = frac[(q - whole).toStringAsFixed(2)];
  final rest = q - whole;
  if (f != null) return whole == 0 ? f : '$whole$f';
  if (q >= 10 || rest == 0) return q.round().toString();
  return q.toStringAsFixed(1).replaceAll('.0', '');
}

/// „200 g“, „2 lžíce“; neznámá jednotka zůstane jako id.
String formatAmount(AppLocalizations l, double? qty, String? unit, double scale) {
  if (qty == null) return l.toTaste;
  final u = unit == null ? '' : (l.unit(unit).isEmpty ? unit : l.unit(unit));
  return '${formatQty(qty * scale)} $u'.trim();
}

String formatTimer(int sec) {
  final m = sec ~/ 60, s = sec % 60;
  if (m >= 60) return '${m ~/ 60}:${(m % 60).toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  return '$m:${s.toString().padLeft(2, '0')}';
}
