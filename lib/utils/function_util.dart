import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:sts/constant.dart';

class FunctionUtil{
  static Future<bool> checkConnection() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
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