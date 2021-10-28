import 'package:brainshield/modules/my_product/my_product_controller.dart';
import 'package:get/get.dart';

class MyProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProductController());
  }
}
