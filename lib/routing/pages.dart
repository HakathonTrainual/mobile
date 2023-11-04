import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/screens/splash/controller/splash_binding.dart';
import 'package:hackathon_trainual_mobile/screens/splash/view/splash_screen.dart';

class GetPages {
  static List<GetPage<dynamic>>? get pages => [
        GetPage(
          name: SplashScreen.routeName,
          page: () => const SplashScreen(),
          binding: SplashBinding(),
        ),
      ];
}
