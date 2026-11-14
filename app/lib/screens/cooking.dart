import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';

import '../data/content.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';
import 'widgets.dart';

/// Režim vaření (§12.3): krok po kroku, velké písmo, časovač u kroku.
class CookingScreen extends StatefulWidget {
  const CookingScreen(this.recipe, {super.key});
  final Recipe recipe;
  @override
  State<CookingScreen> createState() => _CookingScreenState();
}

class _CookingScreenState extends State<CookingScreen> {
  final pages = PageController();
  int step = 0;
  Timer? timer;
  int left = 0;
  int timerStep = -1;
  int timers = 0; // timers started, for the statistics
  TelemetryFlow? flow;

  Map<String, Object> get flowProps => {'step': (step + 1).clamp(0, 100), 'timers': timers.clamp(0, 100)};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (flow == null) {
      Telemetry.feature('cooking_mode');
      final steps = widget.recipe.t(Scope.of(context).lang).steps.length;
      flow = Telemetry.flow('cook', {'steps': steps.clamp(0, 100)}, () => flowProps);
    }
  }

  @override
  void dispose() {
    flow?.end('cancel', flowProps); // no-op after a finished cook
    timer?.cancel();
    pages.dispose();
    super.dispose();
  }

  void startTimer(int sec) {
    Telemetry.feature('step_timer');
    timers++;
    timer?.cancel();
    setState(() {
      left = sec;
      timerStep = step;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() => left--);
      if (left <= 0) {
        t.cancel();
        HapticFeedback.heavyImpact();
        SystemSound.play(SystemSoundType.alert);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).timerDone)));
        }
      }
    });
  }

  Future<void> finish() async {
    flow?.end('ok', flowProps);
    Telemetry.activation();
    final l = AppLocalizations.of(context);
    final s = Scope.of(context);
    final used = widget.recipe.required.map((x) => x.ingredient.id).where(s.pantry.contains).toList();
    if (used.isNotEmpty) {
      // §11: odečet jen po potvrzení.
      final remove = await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text(l.cookedTitle),
          content: Text(l.cookedBody),
          actions: [
            TextButton(onPressed: () => Navigator.pop(c, false), child: Text(l.keep)),
            FilledButton(onPressed: () => Navigator.pop(c, true), child: Text(l.removeUsed)),
          ],
        ),
      );
      if (remove == true) {
        Telemetry.feature('pantry_deduct');
        for (final id in used) {
          await s.removeFromPantry(id);
        }
      }
    }
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final s = Scope.of(context);
    final steps = widget.recipe.t(s.lang).steps;
    final last = step == steps.length - 1;
    return Scaffold(
      appBar: AppBar(title: Text(l.stepOf(step + 1, steps.length))),
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(value: (step + 1) / steps.length),
            Expanded(
              child: PageView.builder(
                controller: pages,
                itemCount: steps.length,
                onPageChanged: (i) => setState(() => step = i),
                itemBuilder: (c, i) {
                  final st = steps[i];
                  final running = timerStep == i && left > 0;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(st.text, style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 1.4)),
                        if (st.timerSec > 0) ...[
                          const SizedBox(height: 32),
                          Center(
                            child: running
                                ? Text(formatTimer(left), style: Theme.of(context).textTheme.displayLarge)
                                : FilledButton.tonalIcon(
                                    icon: const Icon(Icons.timer),
                                    label: Text(l.startTimer(formatTimer(st.timerSec))),
                                    onPressed: () => startTimer(st.timerSec),
                                  ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            if (timerStep >= 0 && timerStep != step && left > 0)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Chip(avatar: const Icon(Icons.timer, size: 18), label: Text(formatTimer(left))),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  if (step > 0)
                    OutlinedButton(
                      onPressed: () =>
                          pages.previousPage(duration: const Duration(milliseconds: 250), curve: Curves.easeOut),
                      child: Text(l.back),
                    ),
                  const Spacer(),
                  FilledButton(
                    style: FilledButton.styleFrom(minimumSize: const Size(140, 56)),
                    onPressed: last
                        ? finish
                        : () => pages.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeOut),
                    child: Text(last ? l.done : l.next),
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
