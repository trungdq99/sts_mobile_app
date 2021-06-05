import 'package:get/get.dart';

class ResponseStatusUtil {

  static const String SUCCESS = 'success';
  static const String ERROR = 'error';
  static const String UNAUTHENTICATED = 'unauthenticated';
  static const String TIME_OUT = 'time_out';
  static const String NO_CONNECTION = 'no_connection';

  static String checkResponse(Response response) {
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
