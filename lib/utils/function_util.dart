import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sts/constant.dart';
import 'package:table_calendar/table_calendar.dart';

class FunctionUtil {
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

  static closeApp() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  static bool isToday({@required DateTime date}) {
    return isSameDay(date, DateTime.now());
  }
}
