import 'package:get/get.dart';

enum ResponseStatus {
  UNAUTHENTICATED,
  SUCCESS,
  ERROR,
  TIME_OUT,
  NO_CONNECTION,
  SEVER_ERROR,
}

class ResponseStatusUtil {

  static ResponseStatus checkResponse(Response response) {
    if (response == null) return ResponseStatus.ERROR;
    if (response.statusCode >= 200 && response.statusCode <= 204) {
      return ResponseStatus.SUCCESS;
    }
    if (response.statusCode == 401) {
      return ResponseStatus.UNAUTHENTICATED;
    }
    return ResponseStatus.ERROR;
  }
}
