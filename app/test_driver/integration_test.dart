import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

// Uloží screenshoty z integration_test/screenshots_test.dart do ../out/screenshots.
Future<void> main() => integrationDriver(
      onScreenshot: (name, bytes, [args]) async {
        final f = File('../out/screenshots/$name.png');
        await f.parent.create(recursive: true);
        await f.writeAsBytes(bytes);
        return true;
      },
    );
