import 'package:get/get.dart';
import 'package:sts/utils/function_util.dart';
import 'package:sts/utils/url_util.dart';

enum RequestMethod {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE,
}

class ApiClient extends GetConnect {
  ApiClient();

  // Future fetchData({
  //   String api,
  //   RequestMethod method,
  //   Map<String, String> header,
  //   dynamic body,
  // }) async {
  //   if (await UtilFunction.checkConnection()) {
  //     print('Call api: ${UtilUrl.BASE_URL}/$api');
  //     Response response;

  //     if (method == RequestMethod.GET) {
  //       response =
  //           await get('${UtilUrl.BASE_URL}/$api', headers: header).timeout(
  //         Duration(milliseconds: 5000),
  //         onTimeout: () {
  //           throw Exception(UtilStatus.TIME_OUT);
  //         },
  //       );
  //     } else if (method == RequestMethod.POST) {
  //       response = await post(
  //         '${UtilUrl.BASE_URL}/$api',
  //         body,
  //         headers: header,
  //       ).timeout(
  //         Duration(milliseconds: 5000),
  //         onTimeout: () {
  //           throw Exception(UtilStatus.TIME_OUT);
  //         },
  //       );
  //     } else if (method == RequestMethod.PUT) {
  //       response = await put(
  //         '${UtilUrl.BASE_URL}/$api',
  //         body,
  //         headers: header,
  //       ).timeout(
  //         Duration(milliseconds: 5000),
  //         onTimeout: () {
  //           throw Exception(UtilStatus.TIME_OUT);
  //         },
  //       );
  //     } else if (method == RequestMethod.PATCH) {
  //       response = await patch(
  //         '${UtilUrl.BASE_URL}/$api',
  //         body,
  //         headers: header,
  //       ).timeout(
  //         Duration(milliseconds: 5000),
  //         onTimeout: () {
  //           throw Exception(UtilStatus.TIME_OUT);
  //         },
  //       );
  //     } else if (method == RequestMethod.DELETE) {
  //       response = await delete(
  //         '${UtilUrl.BASE_URL}/$api',
  //         headers: header,
  //       ).timeout(
  //         Duration(milliseconds: 5000),
  //         onTimeout: () {
  //           throw Exception(UtilStatus.TIME_OUT);
  //         },
  //       );
  //     }

  //     print('Status: ${response?.statusCode}');
  //     print('Response: ${response?.body}');
  //     return response;
  //   }
  // }
}