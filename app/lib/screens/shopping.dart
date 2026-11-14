import 'package:flutter/material.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';

import '../l10n/app_localizations.dart';
import '../main.dart';

/// Nákup (§12.5): checklist podle kategorie, „Nakoupeno“ přesune do spíže.
class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final s = Scope.of(context);
    final items = s.shopping.keys.map((id) => s.content.ingredients[id]!).toList()
      ..sort((a, b) {
        final c = l.category(a.category).compareTo(l.category(b.category));
        return c != 0 ? c : a.name(s.lang).compareTo(b.name(s.lang));
      });
    final anyChecked = s.shopping.values.any((v) => v);
    return Scaffold(
      appBar: AppBar(title: Text(l.tabShopping)),
      body: items.isEmpty
          ? Center(child: Text(l.shoppingEmpty))
          : ListView(
              padding: const EdgeInsets.only(bottom: 96),
              children: [
                for (final (i, it) in items.indexed) ...[
                  if (i == 0 || items[i - 1].category != it.category)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Text(l.category(it.category), style: Theme.of(context).textTheme.titleMedium),
                    ),
                  Dismissible(
                    key: ValueKey(it.id),
                    onDismissed: (_) => s.removeFromShopping(it.id),
                    child: CheckboxListTile(
                      value: s.shopping[it.id],
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        it.name(s.lang),
                        style: s.shopping[it.id]! ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
                      ),
                      onChanged: (_) => s.toggleShopping(it.id),
                    ),
                  ),
                ],
              ],
            ),
      floatingActionButton: anyChecked
          ? FloatingActionButton.extended(
              icon: const Icon(Icons.done_all),
              label: Text(l.checkout),
              onPressed: () async {
                final n = await s.checkoutShopping();
                Telemetry.feature('checkout');
                Telemetry.track('shopping_checkout', {'items': n.clamp(0, 10000)});
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.checkedOut(n))));
                }
              },
            )
          : null,
    );
  }
}
