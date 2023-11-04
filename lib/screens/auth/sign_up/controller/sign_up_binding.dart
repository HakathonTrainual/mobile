import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/screens/auth/sign_up/controller/sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
