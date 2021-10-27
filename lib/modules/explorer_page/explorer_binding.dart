import 'package:brainshield/modules/explorer_page/explorer_controller.dart';
import 'package:get/get.dart';

class ExplorerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExplorerController());
  }
}
