import 'package:flutter/material.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';

import '../l10n/app_localizations.dart';

/// Nastavení: zatím jen vypínač anonymních statistik (docs/telemetry.md).
/// Otevírá se jen v buildu, který statistiky umí poslat.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.settings)),
      body: ListView(
        children: [
          if (Telemetry.isConfigured)
            SwitchListTile(
              title: Text(l.statsToggle),
              subtitle: Text(l.statsToggleBody),
              value: Telemetry.isEnabled,
              onChanged: (on) async {
                await Telemetry.setEnabled(on);
                if (mounted) setState(() {});
              },
            ),
        ],
      ),
    );
  }
}

void openSettings(BuildContext context) => Navigator.push(
  context,
  MaterialPageRoute(
    settings: const RouteSettings(name: '/settings'),
    builder: (_) => const SettingsScreen(),
  ),
);
