import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/resources/color_styles.dart';
import 'package:hackathon_trainual_mobile/resources/text_styles.dart';
import 'package:hackathon_trainual_mobile/screens/auth/sign_in/controller/sign_in_controller.dart';
import 'package:hackathon_trainual_mobile/screens/widgets/common_button.dart';

class SignInScreen extends GetView<SignInController> {
  static const routeName = '/sign-up';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello again! 👋',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 28,
                    color: AppColors.textPrimaryLicorice,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Email',
                        style: AppTextStyle.bold.copyWith(
                          fontSize: 15,
                          color: AppColors.textPrimaryLicorice,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      onChanged: controller.onChangeEmail,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Password',
                        style: AppTextStyle.bold.copyWith(
                          fontSize: 15,
                          color: AppColors.textPrimaryLicorice,
                        ),
                      ),
                    ),
                    TextField(
                      onChanged: controller.onChangePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48.0),
                    Center(
                      child: CommonButton.primary(
                        size: const CommonButtonSizePreset.largeMatchParent(),
                        text: 'Sign in',
                        onPressed: controller.onSignInClicked,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
