import 'package:flutter/material.dart';

import '../data/app_state.dart';
import '../data/content.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';

/// Spíž (§12.4): našeptávač nad aliasy a seznam podle kategorií.
class PantryScreen extends StatefulWidget {
  const PantryScreen({super.key});
  @override
  State<PantryScreen> createState() => _PantryScreenState();
}

class _PantryScreenState extends State<PantryScreen> {
  final query = TextEditingController();
  final focus = FocusNode();

  @override
  void dispose() {
    query.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final s = Scope.of(context);
    final items = s.pantry.map((id) => s.content.ingredients[id]!).toList();
    final byCat = <String, List<Ingredient>>{};
    for (final i in items) {
      byCat.putIfAbsent(i.category, () => []).add(i);
    }
    final cats = byCat.keys.toList()..sort((a, b) => l.category(a).compareTo(l.category(b)));
    final hits = s.content.suggest(query.text, s.lang).where((i) => !s.pantry.contains(i.id)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(l.tabPantry)),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: TextField(
            controller: query,
            focusNode: focus,
            autocorrect: false,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: l.searchIngredient,
              border: const OutlineInputBorder(),
              suffixIcon: query.text.isEmpty
                  ? null
                  : IconButton(icon: const Icon(Icons.clear), onPressed: () => setState(query.clear)),
            ),
            onChanged: (_) => setState(() {}),
            onSubmitted: (_) {
              if (hits.isNotEmpty) add(s, hits.first);
            },
          ),
        ),
        Expanded(
          child: query.text.isNotEmpty
              ? ListView(children: [
                  for (final i in hits)
                    ListTile(
                      leading: const Icon(Icons.add_circle_outline),
                      title: Text(i.name(s.lang)),
                      subtitle: Text(l.category(i.category)),
                      onTap: () => add(s, i),
                    ),
                ])
              : items.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text('${l.pantryEmpty}\n\n${l.pantryStaplesNote}', textAlign: TextAlign.center),
                      ),
                    )
                  : ListView(padding: const EdgeInsets.only(bottom: 24), children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(l.pantryStaplesNote, style: Theme.of(context).textTheme.bodySmall),
                      ),
                      for (final c in cats) ...[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                          child: Text(l.category(c), style: Theme.of(context).textTheme.titleMedium),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Wrap(spacing: 8, runSpacing: 8, children: [
                            for (final i in byCat[c]!..sort((a, b) => a.name(s.lang).compareTo(b.name(s.lang))))
                              InputChip(label: Text(i.name(s.lang)), onDeleted: () => s.removeFromPantry(i.id)),
                          ]),
                        ),
                      ],
                    ]),
        ),
      ]),
    );
  }

  void add(AppState s, Ingredient i) {
    s.addToPantry([i.id]);
    setState(query.clear);
    focus.requestFocus();
  }
}
