import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String? address;
  @override
  void onInit() {
    EthProvider().initProvider();
    super.onInit();
  }
}
