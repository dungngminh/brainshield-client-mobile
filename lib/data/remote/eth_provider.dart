import 'dart:convert';
import 'package:brainshield/PictureAssets.g.dart';
import 'package:brainshield/data/models/picture.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class EthProvider {
  late Client _httpClient;
  late Web3Client _ethClient;
  Credentials? _credentials;
  EthereumAddress? _ownAddress;
  String? _address;
  String? get address => _address;
  final String _contractAddress = "0xD0d5AbCe71CE775214080eD751b960e704984F59";
  PictureAssets? _pictureAssets;
  static final EthProvider _ = EthProvider._internal();
  List<Picture> listPicture = [];
  int countPicture = 0;

  factory EthProvider() {
    return _;
  }

  EthProvider._internal();

  Future<void> initProvider() async {
    _httpClient = Client();
    _ethClient = Web3Client(
        "https://ropsten.infura.io/v3/241f03331919423cba6145c7a2bcc61a",
        _httpClient);
    _pictureAssets = PictureAssets(
        address: EthereumAddress.fromHex(_contractAddress), client: _ethClient);
    print(_httpClient.toString());
    print(_ethClient.toString());
    print(_pictureAssets.toString());
    countPicture = await getPictureCount();
    await getPictureList();
  }

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("lib/PictureAssets.abi.json");
    var jsonAbi = jsonDecode(abi);
    String _abiCode = jsonEncode(jsonAbi);

    final contract = DeployedContract(
      ContractAbi.fromJson(_abiCode, "PictureAssets"),
      EthereumAddress.fromHex(_contractAddress),
    );
    return contract;
  }

  Future<String> getCredentials(String privateKey) async {
    _credentials = EthPrivateKey.fromHex(privateKey);
    _ownAddress = await _credentials!.extractAddress();
    _address = _ownAddress.toString();
    print(_address);
    return _address!;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> params) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await _ethClient.call(
        contract: contract, function: ethFunction, params: params);
    return result;
  }

  Future<num> getBalance() async {
    EtherAmount balance = await _ethClient.getBalance(_ownAddress!);
    print(balance.getValueInUnit(EtherUnit.ether));
    return balance.getValueInUnit(EtherUnit.ether);
  }

  Future<int> getPictureCount() async {
    BigInt count = await _pictureAssets!.pictureCount();
    return count.toInt();
  }

  Future<List<Picture>> getPictureList() async {
    int count = countPicture;
    for (int i = 1; i <= count; i++) {
      var tempPicture = await _pictureAssets!.pictures(BigInt.from(i));
      listPicture.add(
        Picture(
          id: i,
          accountAddress: tempPicture.accountAddress,
          ipfsInfo: tempPicture.ipfsInfo,
          name: tempPicture.name,
          description: tempPicture.description,
          vote: tempPicture.vote,
        ),
      );
    }
    return listPicture;
  }

  List<Picture> getMyAccountPicture() {
    List<Picture> accountPicture = [];
    for (var element in listPicture) {
      if (element.accountAddress == _ownAddress.toString()) {
        accountPicture.add(element);
      }
    }
    return accountPicture;
  }

  Future<String> createPicture(
      String ipfsInfo, String name, String description, BigInt vote) async {
    String result = await _pictureAssets!.createPicture(
      _ownAddress.toString(),
      ipfsInfo,
      name,
      description,
      vote,
      credentials: _credentials!,
    );
    print(result);
    return result;
  }
}
