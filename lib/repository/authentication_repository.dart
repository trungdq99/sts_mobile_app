import 'dart:async';
import 'package:meta/meta.dart';
import 'package:get/get.dart';
import 'package:sts/constant.dart';
import 'package:sts/models/authentication_model.dart';
import 'package:sts/utils/response_status_util.dart';
import 'package:sts/utils/url_util.dart';
import 'api_client.dart';

class AuthenticationRepository {
  AuthenticationRepository();

  final StreamController<AuthenticationModel> _controller =
      StreamController<AuthenticationModel>();

  Stream<AuthenticationModel> get authentication async* {
    // await Future<void>.delayed(const Duration(seconds: 1));
    // yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  void dispose() => _controller.close();

  Future<void> loginWithUsernameAndPassword({
    @required String username,
    @required String password,
  }) async {
    Response response = await apiClient.fetchData(
      api: UrlUtil.LOGIN,
      method: RequestMethod.POST,
      body: {
        'username': username,
        'password': password,
      },
    );
    String status = ResponseStatusUtil.checkResponse(response);
    final json = response.body;
      AuthenticationModel authenticationModel =
          AuthenticationModel.fromJson(json);
    if (status == ResponseStatusUtil.SUCCESS) {
      
      _controller.add(authenticationModel);
    } else {
      throw Exception(authenticationModel.message);
    }
  }

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

  Future<void> logout(
      //   {
      //   @required String token,
      // }
      ) async {
        _controller.add(AuthenticationModel.empty);
    // Response response = await apiClient.fetchData(
    //   api: UtilUrl.LOGOUT,
    //   header: UtilFunction.getAuthorizeHeader(token),
    //   method: RequestMethod.POST,
    //   body: {},
    // );
    // String status = UtilFunction.checkResponse(response);
    // if (status == UtilStatus.SUCCESS) {
    //   String resStatus = response.body['status'];
    //   if (resStatus == 'success') {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } else if (status == UtilStatus.UNAUTHENTICATED) {
    //   throw Exception(status);
    // } else {
    //   throw Exception('Logout failed!!!');
    // }
  }
}
