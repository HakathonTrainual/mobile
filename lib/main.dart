import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackathon_trainual_mobile/screens/app.dart';

import 'global_binding.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await GlobalBindings().initialize();

      runApp(const MyApp());
    },
    (error, stackTrace) {
      debugPrint(error.toString());
    },
  );
}
