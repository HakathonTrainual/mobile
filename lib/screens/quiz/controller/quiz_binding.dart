import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/screens/quiz/controller/quiz_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QuizController());
  }
}
