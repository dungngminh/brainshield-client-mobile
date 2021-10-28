import 'package:brainshield/data/remote/eth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum Status { loading, error, done }

class AccountController extends GetxController {
  var address = "".obs;
  var balance = 0.0.obs;
  final status = Status.loading.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    address.value = EthProvider().address;
    await getBalance();
  }

  getBalance() async {
    status(Status.loading);
    await EthProvider().getBalance().then((value) {
      balance(value as double);
      status(Status.done);
    });
  }

  showQRCode(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("QR Code", style: GoogleFonts.openSans(fontSize: 24)),
                QrImage(
                  data: address.value,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                TextButton(onPressed: () => Get.back(), child: Text("Hủy")),
              ],
            ),
          );
        });
  }

  openURl() async {
    await canLaunch("https://ropsten.etherscan.io/address/${address.value}")
        ? await launch("https://ropsten.etherscan.io/address/${address.value}")
        : Fluttertoast.showToast(
            msg: "Không thể truy cập địa chỉ",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
          );
  }

  copyAddress() {
    Clipboard.setData(
      ClipboardData(text: address.value),
    ).then(
      (value) => Fluttertoast.showToast(
        msg: "Đã copy địa chỉ",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      ),
    );
  }
}
