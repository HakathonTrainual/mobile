import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/providers/cache_provider.dart';
import 'package:hackathon_trainual_mobile/data/services/user_service.dart';
import 'package:hackathon_trainual_mobile/screens/auth/sign_up/view/sign_up.dart';
import 'package:hackathon_trainual_mobile/screens/home/view/home_screen.dart';

class SplashController extends GetxController {
  final CacheProvider _cacheProvider;
  final UserService _userService;

  SplashController({
    required CacheProvider cacheProvider,
    required UserService userService,
  })  : _cacheProvider = cacheProvider,
        _userService = userService;

  @override
  Future<void> onReady() async {
    if (_cacheProvider.isAuthorized) {
      await _userService.fetchUser();
      Get.toNamed(HomeScreen.routeName);
    } else {
      Get.toNamed(SignUpScreen.routeName);
    }
    super.onReady();
  }
}
