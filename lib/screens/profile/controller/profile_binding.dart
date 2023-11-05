import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/screens/profile/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController(userService: Get.find()));
  }
}
