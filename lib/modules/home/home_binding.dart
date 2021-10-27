import 'package:brainshield/modules/explorer_page/explorer_controller.dart';
import 'package:brainshield/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ExplorerController());
  }
}
