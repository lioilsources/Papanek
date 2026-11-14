import 'package:flutter/material.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';

import '../data/content.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';
import 'cooking.dart';
import 'shop.dart';
import 'widgets.dart';

/// Detail receptu (§12.2): suroviny ✅/❌, porce, „na nákup“, „Vařit“.
class RecipeScreen extends StatefulWidget {
  const RecipeScreen(this.recipe, {super.key});
  final Recipe recipe;
  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late int servings = widget.recipe.servings;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final s = Scope.of(context);
    final r = widget.recipe;
    final txt = r.t(s.lang);
    final tt = Theme.of(context).textTheme;
    final scale = servings / r.servings;
    final missing = s.missing(r);
    final locked = !s.unlocked(r);
    final pack = s.content.packs.where((p) => p.id == r.pack).firstOrNull;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(expandedHeight: 280, flexibleSpace: FlexibleSpaceBar(background: RecipeImage(r))),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.list(
              children: [
                Text(txt.title, style: tt.headlineMedium),
                const SizedBox(height: 8),
                Text(txt.summary, style: tt.bodyLarge),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(avatar: const Icon(Icons.timer_outlined, size: 18), label: Text(l.minutes(r.totalMin))),
                    Chip(
                      avatar: const Icon(Icons.signal_cellular_alt, size: 18),
                      label: Text(l.difficulty('${r.difficulty}')),
                    ),
                    Chip(avatar: const Icon(Icons.public, size: 18), label: Text(l.cuisine(r.cuisine))),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Text(l.ingredients, style: tt.titleLarge)),
                    IconButton.outlined(
                      onPressed: servings > 1
                          ? () {
                              Telemetry.feature('servings');
                              setState(() => servings--);
                            }
                          : null,
                      icon: const Icon(Icons.remove),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text(l.servings(servings))),
                    IconButton.outlined(
                      onPressed: servings < 12
                          ? () {
                              Telemetry.feature('servings');
                              setState(() => servings++);
                            }
                          : null,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                for (final line in r.lines)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      s.has(line.ingredient) ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: s.has(line.ingredient) ? Colors.green.shade600 : null,
                    ),
                    title: Text(line.ingredient.name(s.lang)),
                    subtitle:
                        [
                          if (line.note[s.lang]?.isNotEmpty ?? false) line.note[s.lang]!,
                          if (line.optional) l.optional,
                        ].isEmpty
                        ? null
                        : Text(
                            [
                              if (line.note[s.lang]?.isNotEmpty ?? false) line.note[s.lang]!,
                              if (line.optional) l.optional,
                            ].join(' · '),
                          ),
                    trailing: Text(formatAmount(l, line.qty, line.unit, scale), style: tt.bodyLarge),
                  ),
                if (missing.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.add_shopping_cart),
                      label: Text(l.addMissingToShopping),
                      onPressed: () async {
                        Telemetry.feature('shopping_list');
                        Telemetry.track('shopping_add', {'items': missing.length.clamp(0, 100)});
                        await s.addToShopping(missing.map((i) => i.id));
                        if (context.mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(l.addedToShopping(missing.length))));
                        }
                      },
                    ),
                  ),
                const SizedBox(height: 20),
                if (locked)
                  Card(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.lock),
                              const SizedBox(width: 8),
                              Expanded(child: Text(l.lockedTitle(pack?.name(s.lang) ?? r.pack), style: tt.titleMedium)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(l.lockedBody),
                          const SizedBox(height: 12),
                          FilledButton.icon(
                            icon: const Icon(Icons.lock_open),
                            label: Text(l.unlock),
                            onPressed: () {
                              Telemetry.lockedTap('unlock');
                              openShop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                if (!locked) ...[
                  Text(l.steps, style: tt.titleLarge),
                  const SizedBox(height: 8),
                  for (final (i, st) in txt.steps.indexed)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(radius: 14, child: Text('${i + 1}')),
                          const SizedBox(width: 12),
                          Expanded(child: Text(st.text, style: tt.bodyLarge)),
                        ],
                      ),
                    ),
                  if (txt.tips.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(l.tips, style: tt.titleLarge),
                    const SizedBox(height: 8),
                    Text(txt.tips, style: tt.bodyLarge),
                  ],
                ],
                const SizedBox(height: 96),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: locked
          ? null
          : FloatingActionButton.extended(
              icon: const Icon(Icons.local_fire_department),
              label: Text(l.startCooking),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/cooking'),
                  builder: (_) => CookingScreen(r),
                ),
              ),
            ),
    );
  }
}
