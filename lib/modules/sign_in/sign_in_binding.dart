import 'package:brainshield/modules/sign_in/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
