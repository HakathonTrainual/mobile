import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/screens/home/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
