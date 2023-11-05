import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/screens/auth/sign_in/controller/sign_in_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInController(userService: Get.find()));
  }
}
