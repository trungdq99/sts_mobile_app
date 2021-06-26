/*
 * Author: Trung Shin
 */

import 'package:get/get.dart';
import 'package:sts/constant.dart';
import 'package:sts/utils/function_util.dart';
import 'package:sts/utils/response_status_util.dart';
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

  void setToken(String token) => httpClient.addAuthenticator((request) async {
        // Set the header
        request.headers['Authorization'] = 'Bearer $token';
        return request;
      });

  Future fetchData({
    String api,
    RequestMethod method,
    Map<String, String> header,
    dynamic body,
  }) async {
    if (await FunctionUtil.checkConnection()) {
      print('Call api: ${UrlUtil.BASE_URL}/$api');
      print('Method: $method');
      Response response;
      if (method == RequestMethod.GET) {
        response =
            await get('${UrlUtil.BASE_URL}/$api', headers: header).timeout(
          Duration(milliseconds: REQUEST_TIME_OUT),
          onTimeout: () {
            throw Exception(ResponseStatusUtil.TIME_OUT);
          },
        );
      } else if (method == RequestMethod.POST) {
        response = await post(
          '${UrlUtil.BASE_URL}/$api',
          body,
          headers: header,
        ).timeout(
          Duration(milliseconds: REQUEST_TIME_OUT),
          onTimeout: () {
            throw Exception(ResponseStatusUtil.TIME_OUT);
          },
        );
      } else if (method == RequestMethod.PUT) {
        response = await put(
          '${UrlUtil.BASE_URL}/$api',
          body,
          headers: header,
        ).timeout(
          Duration(milliseconds: REQUEST_TIME_OUT),
          onTimeout: () {
            throw Exception(ResponseStatusUtil.TIME_OUT);
          },
        );
      } else if (method == RequestMethod.PATCH) {
        response = await patch(
          '${UrlUtil.BASE_URL}/$api',
          body,
          headers: header,
        ).timeout(
          Duration(milliseconds: REQUEST_TIME_OUT),
          onTimeout: () {
            throw Exception(ResponseStatusUtil.TIME_OUT);
          },
        );
      } else if (method == RequestMethod.DELETE) {
        response = await delete(
          '${UrlUtil.BASE_URL}/$api',
          headers: header,
        ).timeout(
          Duration(milliseconds: REQUEST_TIME_OUT),
          onTimeout: () {
            throw Exception(ResponseStatusUtil.TIME_OUT);
          },
        );
      }

      print('Status: ${response?.statusCode}');
      print('Response: ${response?.body}');
      return response;
    } else {
      throw Exception(ResponseStatusUtil.NO_CONNECTION);
    }
  }
}
