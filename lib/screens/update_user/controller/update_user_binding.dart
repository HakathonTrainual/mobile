import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/screens/update_user/controller/update_user_controller.dart';

class UpdateUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UpdateUserController(
        userService: Get.find(),
        apiClient: Get.find(),
      ),
    );
  }
}
