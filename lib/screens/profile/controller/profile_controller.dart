import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/models/user.dart';
import 'package:hackathon_trainual_mobile/data/providers/cache_provider.dart';
import 'package:hackathon_trainual_mobile/data/services/user_service.dart';
import 'package:hackathon_trainual_mobile/screens/auth/sign_in/view/sign_in.dart';

class ProfileController extends GetxController {
  final UserService _userService;

  ProfileController({required UserService userService})
      : _userService = userService;

  User get user => _userService.user!;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final descController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    descController.text = user.description;
  }

  Future<void> onLogOutClicked() async {
    Get.find<CacheProvider>().clearAuthData();
    Get.offAllNamed(SignInScreen.routeName);
  }
}
