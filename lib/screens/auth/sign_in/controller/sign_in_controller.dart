import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/providers/cache_provider.dart';
import 'package:hackathon_trainual_mobile/data/services/user_service.dart';
import 'package:hackathon_trainual_mobile/screens/home/view/home_screen.dart';
import 'package:hackathon_trainual_mobile/screens/update_user/view/update_user_screen.dart';

class SignInController extends GetxController {
  final UserService _userService;

  SignInController({
    required UserService userService,
  }) : _userService = userService;

  final Rx<String> _email = ''.obs;
  final Rx<String> _password = ''.obs;

  void onChangeEmail(String value) => _email.value = value;
  void onChangePassword(String value) => _password.value = value;

  Future<void> onSignInClicked() async {
    if (_email.value.isEmpty || _password.value.isEmpty) return;

    await _userService.signIn(
      _email.value,
      _password.value,
    );

    if (!_userService.user!.hasDescription || !_userService.user!.hasHobbies) {
      Get.offAndToNamed(UpdateUserScreen.routeName);
    } else {
      Get.offAndToNamed(HomeScreen.routeName);
    }
  }
}
