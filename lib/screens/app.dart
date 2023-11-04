import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/routing/pages.dart';
import 'package:hackathon_trainual_mobile/screens/splash/controller/splash_binding.dart';
import 'package:hackathon_trainual_mobile/screens/splash/view/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hackathon Trainual Mobile',
      theme: ThemeData(
        useMaterial3: true,
      ),
      enableLog: true,
      themeMode: ThemeMode.light,
      initialBinding: SplashBinding(),
      defaultTransition: Transition.fade,
      popGesture: true,
      initialRoute: SplashScreen.routeName,
      getPages: GetPages.pages,
      home: const Text('Hello World'),
    );
  }
}
