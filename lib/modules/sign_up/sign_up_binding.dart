import 'package:brainshield/modules/sign_in/sign_in_controller.dart';
import 'package:brainshield/modules/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
