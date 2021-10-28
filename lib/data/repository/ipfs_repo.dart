import 'dart:io';

import 'package:brainshield/data/remote/ipfs_provider.dart';
import 'dart:convert' as convert;

class IPFSRepository {
  Future<String> uploadImage(String fileName, File file) async {
    try {
      String response = await IPFSProvider().uploadImage(fileName, file);
      var result = convert.jsonDecode(response);
      String hash = result["Hash"];
      return hash;
    } catch (_) {
      throw Exception("Can't upload image");
    }
  }
}
