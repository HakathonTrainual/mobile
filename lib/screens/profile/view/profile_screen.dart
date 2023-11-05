import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/providers/cache_provider.dart';
import 'package:hackathon_trainual_mobile/screens/auth/sign_in/view/sign_in.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Profile Screen'),
          TextButton(
            onPressed: () {
              Get.find<CacheProvider>().clearAuthData();
              Get.offAndToNamed(SignInScreen.routeName);
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
