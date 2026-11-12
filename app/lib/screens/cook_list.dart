import 'package:flutter/material.dart';

import '../data/app_state.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';
import 'recipe.dart';
import 'widgets.dart';

/// Domů / Co uvařím (§12.1): skupiny podle počtu chybějících surovin (§8).
class CookList extends StatelessWidget {
  const CookList({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final s = Scope.of(context);
    final all = s.matches();
    final groups = <(String, List<Match>)>[
      (l.groupReady, all.where((m) => m.missing.isEmpty).toList()),
      (l.groupMissing1, all.where((m) => m.missing.length == 1).toList()),
      (l.groupMissing23, all.where((m) => m.missing.length >= 2 && m.missing.length <= 3).toList()),
      (l.groupMore, all.where((m) => m.missing.length > 3).toList()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(l.tabCook),
        actions: [
          TextButton(
            onPressed: () => s.setLang(s.lang == 'cs' ? 'en' : 'cs'),
            child: Text(s.lang == 'cs' ? 'EN' : 'CZ'),
          ),
        ],
      ),
      body: all.isEmpty
          ? Center(child: Text(l.noRecipes))
          : CustomScrollView(
              slivers: [
                if (s.pantry.isEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: Card(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        child: Padding(padding: const EdgeInsets.all(16), child: Text(l.emptyPantryHint)),
                      ),
                    ),
                  ),
                for (final (title, list) in groups)
                  if (list.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                        child: Text('$title · ${list.length}', style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverGrid.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 240,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.78,
                        ),
                        itemCount: list.length,
                        itemBuilder: (c, i) => RecipeCard(list[i]),
                      ),
                    ),
                  ],
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard(this.match, {super.key});
  final Match match;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final s = Scope.of(context);
    final r = match.recipe;
    final t = Theme.of(context).textTheme;
    final ready = match.missing.isEmpty;
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RecipeScreen(r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  RecipeImage(r),
                  if (!s.unlocked(r))
                    Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.black54,
                        child: const Icon(Icons.lock, size: 18, color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r.t(s.lang).title, maxLines: 2, overflow: TextOverflow.ellipsis, style: t.titleSmall),
                  const SizedBox(height: 4),
                  Text(
                    '${l.minutes(r.totalMin)} · ${l.missingCount(match.missing.length)}',
                    style: t.bodySmall?.copyWith(
                      color: ready ? Colors.green.shade700 : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
