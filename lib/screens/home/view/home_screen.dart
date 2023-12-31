import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/resources/color_styles.dart';
import 'package:hackathon_trainual_mobile/screens/home/controller/home_controller.dart';
import 'package:hackathon_trainual_mobile/screens/home/widgets/nav_bar.dart';
import 'package:hackathon_trainual_mobile/screens/profile/view/profile_screen.dart';
import 'package:hackathon_trainual_mobile/screens/quiz/view/quiz_screen.dart';

class HomeScreen extends GetView<HomeController> {
  static const routeName = '/home';

  HomeScreen({super.key});

  late final List<Widget> _children = [
    const QuizScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final children = _children;

    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Obx(
            () => NavBar(
              onTap: controller.onChangeIndex,
              currentIndex: controller.currentIndex,
            ),
          ),
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex,
          children: children,
        ),
      ),
    );
  }
}
