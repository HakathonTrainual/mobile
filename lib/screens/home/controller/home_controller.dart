import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<int> _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  void onChangeIndex(int index) => _currentIndex.value = index;
}
