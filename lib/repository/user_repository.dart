import 'dart:async';
import 'package:get/get.dart';
import 'package:sts/constant.dart';
import 'package:sts/models/user_model.dart';
import 'package:sts/repository/authentication_repository.dart';
import 'package:sts/utils/function_util.dart';
import 'package:sts/utils/response_status_util.dart';
import 'package:sts/utils/url_util.dart';
import 'api_client.dart';

class UserRepository {
  // final AuthenticationRepository _authenticationRepository;
  UserRepository();

  // Get user
  Future<UserModel> getUser() async {
    // Load token on local
    String token = await FunctionUtil.loadToken();
    print('Token: $token');
    UserModel userModel = UserModel.empty;
    if (FunctionUtil.checkToken(token)) {
      // Call Get User Api
      Response response = await apiClient.fetchData(
        api: UrlUtil.USER,
        method: RequestMethod.GET,
        header: FunctionUtil.getAuthorizeHeader(token),
      );

      // Get Response status
      String status = ResponseStatusUtil.getStatus(response);

      // Check Response status is Success or not
      if (status == ResponseStatusUtil.SUCCESS) {
        // Convert response body to Authentication Model
        final json = response.body;
        userModel = UserModel.fromJson(json);
      }
    }
    return userModel;
  }
}
