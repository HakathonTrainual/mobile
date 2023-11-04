import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/services/user_service.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/sign-up';

  const SignUpScreen({super.key});

  /*
   "email": "sd@j2dh.com",
   "password": "Passwodr12"
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Get.find<UserService>().signIn('sd@j2dh.com', 'Passwodr12');
          },
          child: const Text('sign up'),
        ),
      ),
    );
  }
}
