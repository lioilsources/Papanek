import 'package:flutter/material.dart';

import '../data/content.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';

/// Obrázek jídla (fotka, volitelně komiks); bez obrázku barevná plocha s ikonou kuchyně.
class RecipeImage extends StatelessWidget {
  const RecipeImage(this.recipe, {super.key, this.height});
  final Recipe recipe;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    final img = Scope.of(context).dishImage(recipe);
    if (img != null) {
      return Image.asset(img, height: height, width: double.infinity, fit: BoxFit.cover);
    }
    return Container(
      height: height,
      width: double.infinity,
      color: c.primaryContainer,
      child: Icon(Icons.ramen_dining, size: 48, color: c.onPrimaryContainer),
    );
  }
}

/// Čtvercová fotka suroviny nebo nástroje se zaoblenými rohy; bez fotky ikona.
class PhotoThumb extends StatelessWidget {
  const PhotoThumb(this.asset, {super.key, this.size = 40, this.icon = Icons.eco_outlined});
  final String? asset;
  final double size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 5),
      child: SizedBox.square(
        dimension: size,
        child: asset == null
            ? ColoredBox(
                color: c.surfaceContainerHighest,
                child: Icon(icon, size: size * 0.55, color: c.onSurfaceVariant),
              )
            : Image.asset(asset!, fit: BoxFit.cover, cacheWidth: (size * 3).round()),
      ),
    );
  }
}

/// Vodorovný pás nástrojů s fotkami („Budeš potřebovat“, nástroje kroku).
class ToolStrip extends StatelessWidget {
  const ToolStrip(this.tools, {super.key, this.size = 72});
  final List<String> tools;
  final double size;

  @override
  Widget build(BuildContext context) {
    final s = Scope.of(context);
    final list = [for (final t in tools) if (s.content.tools[t] != null) s.content.tools[t]!];
    return SizedBox(
      height: size + 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (c, i) => SizedBox(
          width: size + 8,
          child: Column(
            children: [
              PhotoThumb(s.photos.tool(list[i].slug), size: size, icon: Icons.soup_kitchen_outlined),
              const SizedBox(height: 4),
              Text(
                list[i].name(s.lang),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
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
