import 'package:get/get.dart';

class ResponseStatusUtil {
  static const String SUCCESS = 'success'; // Status: 200 - 204
  static const String ERROR = 'error'; // 
  static const String UNAUTHENTICATED = 'unauthenticated'; // Status: 401
  static const String TIME_OUT = 'time_out'; // Request time out status
  static const String NO_CONNECTION = 'no_connection'; // No internet connection status

  static String getStatus(Response response) {
    if (response == null) return ERROR;
    if (response.statusCode >= 200 && response.statusCode <= 204) {
      return SUCCESS;
    }
    if (response.statusCode == 401) {
      return UNAUTHENTICATED;
    }
    return ERROR;
  }
}
