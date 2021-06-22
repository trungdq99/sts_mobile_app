import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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

  static saveToken(String token) =>
      flutterSecureStorage.write(key: TOKEN_KEY, value: token);

  static removeToken() => flutterSecureStorage.delete(key: TOKEN_KEY);

  static Future<String> loadToken() =>
      flutterSecureStorage.read(key: TOKEN_KEY);

  static Map<String, String> getAuthorizeHeader(String accessToken) {
    return {'Authorization': 'bearer $accessToken'};
  }

  static bool checkToken(String token) {
    bool result = false;
    if (token != null && token.isNotEmpty) {
      if (!JwtDecoder.isExpired(token)) {
        result = true;
      }
    }
    return result;
  }
}
