import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:sts/constant.dart';

class FunctionUtil{
  static Future<bool> checkConnection() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    print(result);
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        return true;
      default:
        return false;
    }
  }
}