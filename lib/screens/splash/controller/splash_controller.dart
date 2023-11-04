import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/data/providers/cache_provider.dart';
import 'package:hackathon_trainual_mobile/screens/auth/sign_up/view/sign_up.dart';
import 'package:hackathon_trainual_mobile/screens/home/view/home_screen.dart';

class SplashController extends GetxController {
  final CacheProvider _cacheProvider;

  SplashController({
    required CacheProvider cacheProvider,
  }) : _cacheProvider = cacheProvider;

  @override
  void onReady() {
    if (_cacheProvider.isAuthorized) {
      // Should be as side effect (not part of business logic)
      Get.toNamed(HomeScreen.routeName);
    } else {
      // Should be as side effect (not part of business logic)
      Get.toNamed(SignUpScreen.routeName);
    }
    super.onReady();
  }
}
