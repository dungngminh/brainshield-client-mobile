import 'package:brainshield/modules/sign_in/sign_in.dart';
import 'package:brainshield/modules/sign_in/sign_in_binding.dart';
import 'package:brainshield/modules/sign_up/sign_up.dart';
import 'package:brainshield/modules/sign_up/sign_up_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.rSignIn;
  static final routes = [
    GetPage(
      name: AppRoutes.rSignIn,
      binding: SignInBinding(),
      page: () => SignInScreen(),
    ),
    GetPage(name: AppRoutes.rSignUp,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
  ];
}
