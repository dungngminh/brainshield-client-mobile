import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String address = "";
  var isSignIn = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    if (EthProvider().address != "") {
      print("Hello");
      address = EthProvider().address;
    }
    if (address != "") {
      isSignIn.value = true;
    }
    update();
    await EthProvider().initProvider();
  }
}
