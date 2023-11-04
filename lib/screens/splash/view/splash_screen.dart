import 'package:flutter/material.dart';
import 'package:hackathon_trainual_mobile/resources/color_styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.discreteCircle(
          secondRingColor: AppColors.secondaryGreen,
          thirdRingColor: AppColors.secondaryYellow,
          color: AppColors.primary,
          size: 36,
        ),
      ),
    );
  }
}
