/*
 * Author: Trung Shin
 */

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sts/constant.dart';
import 'package:sts/custom_widget/notification_dialog_custom_widget.dart';
import 'package:sts/repository/authentication_repository.dart';
import 'package:sts/utils/string_util.dart';

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

  static saveToken(String token) =>
      flutterSecureStorage.write(key: TOKEN_KEY, value: token);

  static removeToken() => flutterSecureStorage.delete(key: TOKEN_KEY);

  static Future<String> loadToken() =>
      flutterSecureStorage.read(key: TOKEN_KEY);

  static bool checkToken(String token) {
    bool result = false;
    if (token != null && token.isNotEmpty) {
      if (!JwtDecoder.isExpired(token)) {
        result = true;
      }
    }
    return result;
  }

  static String getException(dynamic exception) {
    List<String> splitStr = exception.toString().split(':');
    return splitStr.length > 1 ? splitStr[1] : exception;
  }

  static void handleUnauthentication(
      AuthenticationRepository authenticationRepository) {
    Get.dialog(NotificationDialogCustomWidget(
      message: StringUtil.EXPIRED_LOGIN,
      onConfirm: () {
        authenticationRepository.logout();
      },
      isPop: false,
    ));
  }
}
