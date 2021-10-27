import 'dart:io';

import 'package:http/http.dart' as http;

class IPFSProvider {
  static final IPFSProvider _ = IPFSProvider._internal();

  factory IPFSProvider() {
    return _;
  }

  IPFSProvider._internal();

  Future<String> getPicture(String hash) async {
    var responce =
        await http.post(Uri.parse("https://ipfs.infura.io/ipfs/$hash"));
    if (responce.statusCode == 200) {
      print(responce.body);
      return responce.body;
    } else {
      print(responce.body);
      throw Exception("Can not get picture");
    }
  }

  Future<String> uploadImage(String filename, File file) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse("https://ipfs.infura.io:5001/api/v0/add"));
    var pic = await http.MultipartFile.fromPath(filename, file.path);
    request.files.add(pic);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    return responseString;
  }
}
