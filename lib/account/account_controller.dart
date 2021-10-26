import 'package:brainshield/data/eth_provider.dart';
import 'package:get/get.dart';

enum Status { loading, error, done }

class AccountController extends GetxController {
  var address = "".obs;
  var pictureCount = "".obs;
  final status = Status.loading.obs;
  @override
  void onReady() {
    super.onInit();
    address.value = EthProvider().address!;
  }

  getPictureCount() async {
    await EthProvider().getPictureCount(address.value).then((value) {
      pictureCount(value);
      status(Status.done);
    });
    update();
  }
}
