import 'dart:async';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sts/models/authentication_model.dart';
import 'package:sts/utils/url_util.dart';

import 'api_client.dart';

class AuthenticationRepository {
  AuthenticationRepository();

  // Future<AuthenticationModel> checkLogin({
  //   @required String username,
  //   @required String password,
  // }) async {
  //   Response response = await apiClient.fetchData(
  //     api: UtilUrl.LOGIN,
  //     method: RequestMethod.POST,
  //     body: {
  //       'email': username,
  //       'password': password,
  //     },
  //   );
  //   String status = UtilFunction.checkResponse(response);
  //   if (status == UtilStatus.SUCCESS) {
  //     final userJson = response.body;
  //     AuthenticationModel authenticationModel =
  //         AuthenticationModel.fromJson(userJson);
  //     return authenticationModel;
  //   } else if (status == UtilStatus.UNAUTHENTICATED) {
  //     throw Exception(status);
  //   } else {
  //     throw Exception('Check login failed!!!');
  //   }
  // }

  // Future<AuthenticationModel> fetchUser({
  //   @required String token,
  // }) async {
  //   Response response = await apiClient.fetchData(
  //     api: UtilUrl.USER,
  //     header: UtilFunction.getAuthorizeHeader(token),
  //     method: RequestMethod.GET,
  //   );
  //   String status = UtilFunction.checkResponse(response);
  //   if (status == UtilStatus.SUCCESS) {
  //     final userJson = response.body;
  //     AuthenticationModel authenticationModel =
  //         AuthenticationModel.fromJsonWithToken(userJson, token);
  //     return authenticationModel;
  //   } else if (status == UtilStatus.UNAUTHENTICATED) {
  //     throw Exception(status);
  //   } else {
  //     throw Exception('Fetch user failed!!!');
  //   }
  // }

  // Future<AuthenticationModel> updateUser({
  //   @required String token,
  //   @required String name,
  //   @required String phone,
  //   @required String imageSource,
  // }) async {
  //   Map<String, dynamic> map = {
  //     'name': name,
  //     'phone_number': phone,
  //   };
  //   if (imageSource != null && imageSource.isNotEmpty) {
  //     File file = File(imageSource);
  //     map.addAll(
  //         {'avatar': MultipartFile(file, filename: basename(imageSource))});
  //   }
  //   Response response = await apiClient.fetchData(
  //     api: UtilUrl.USER,
  //     header: UtilFunction.getAuthorizeHeader(token),
  //     method: RequestMethod.POST,
  //     body: FormData(map),
  //   );
  //   String status = UtilFunction.checkResponse(response);
  //   if (status == UtilStatus.SUCCESS) {
  //     final userJson = response.body;
  //     AuthenticationModel authenticationModel =
  //         AuthenticationModel.fromJsonWithToken(userJson, token);
  //     return authenticationModel;
  //   } else if (status == UtilStatus.UNAUTHENTICATED) {
  //     throw Exception(status);
  //   } else {
  //     throw Exception('Update user failed!!!');
  //   }
  // }

  // Future<bool> logout({
  //   @required String token,
  // }) async {
  //   Response response = await apiClient.fetchData(
  //     api: UtilUrl.LOGOUT,
  //     header: UtilFunction.getAuthorizeHeader(token),
  //     method: RequestMethod.POST,
  //     body: {},
  //   );
  //   String status = UtilFunction.checkResponse(response);
  //   if (status == UtilStatus.SUCCESS) {
  //     String resStatus = response.body['status'];
  //     if (resStatus == 'success') {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else if (status == UtilStatus.UNAUTHENTICATED) {
  //     throw Exception(status);
  //   } else {
  //     throw Exception('Logout failed!!!');
  //   }
  // }
}