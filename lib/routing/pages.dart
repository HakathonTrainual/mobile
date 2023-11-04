import 'package:get/get.dart';
import 'package:hackathon_trainual_mobile/screens/auth/sign_up/controller/sign_up_binding.dart';
import 'package:hackathon_trainual_mobile/screens/auth/sign_up/view/sign_up.dart';
import 'package:hackathon_trainual_mobile/screens/home/controller/home_binding.dart';
import 'package:hackathon_trainual_mobile/screens/home/view/home_screen.dart';
import 'package:hackathon_trainual_mobile/screens/profile/controller/profile_binding.dart';
import 'package:hackathon_trainual_mobile/screens/quiz/controller/quiz_binding.dart';
import 'package:hackathon_trainual_mobile/screens/splash/controller/splash_binding.dart';
import 'package:hackathon_trainual_mobile/screens/splash/view/splash_screen.dart';

class GetPages {
  static List<GetPage<dynamic>>? get pages => [
        GetPage(
          name: SplashScreen.routeName,
          page: () => const SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => HomeScreen(),
          bindings: [
            HomeBinding(),
            QuizBinding(),
            ProfileBinding(),
          ],
        ),
        GetPage(
          name: SignUpScreen.routeName,
          page: () => const SignUpScreen(),
          binding: SignUpBinding(),
        ),
      ];
}
