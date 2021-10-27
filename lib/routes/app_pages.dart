import 'package:brainshield/modules/account/account.dart';
import 'package:brainshield/modules/account/account_binding.dart';
import 'package:brainshield/modules/explorer_page/explorer_binding.dart';
import 'package:brainshield/modules/explorer_page/explorer_page.dart';
import 'package:brainshield/modules/home/home.dart';
import 'package:brainshield/modules/home/home_binding.dart';
import 'package:brainshield/modules/sign_in/sign_in.dart';
import 'package:brainshield/modules/sign_in/sign_in_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.rHome;
  static final routes = [
    GetPage(
      name: AppRoutes.rSignIn,
      binding: SignInBinding(),
      page: () => SignInScreen(),
    ),
    GetPage(
      name: AppRoutes.rHome,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.rExplorer,
      binding: ExplorerBinding(),
      page: () => ExplorerPage(),
    ),
    GetPage(
      name: AppRoutes.rAccount,
      binding: AccountBinding(),
      page: () => AccountScreen(),
    ),
  ];
}
