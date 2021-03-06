/*
 * Author: Trung Shin
 */

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sts/constant.dart';
import 'package:sts/models/models.dart';
import 'package:sts/utils/utils.dart';
import 'api_client.dart';

class AuthenticationRepository {
  AuthenticationRepository();

  // Use controller to track authen model changed
  final StreamController<AuthenticationModel> _controller =
      StreamController<AuthenticationModel>();

  //
  Stream<AuthenticationModel> get authentication async* {
    yield* _controller.stream;
  }

  void dispose() => _controller.close();

  // Login with Username and Password
  // Username and password is required
  Future<void> loginWithUsernameAndPassword({
    @required String username,
    @required String password,
  }) async {
    // Call Login Api
    Response response = await apiClient.fetchData(
      api: UrlUtil.LOGIN,
      method: RequestMethod.POST,
      body: {
        'username': username,
        'password': password,
      },
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Convert response body to Authentication Model
    final json = response.body;
    AuthenticationModel authenticationModel =
        AuthenticationModel.fromJson(json);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      // Check role of user
      // Required role is staff to use this Application
      if (authenticationModel.tokenDecode.role == ROLE) {
        // User logins with Staff role => Add authen to controller
        _controller.add(authenticationModel);

        // Save token to local
        FunctionUtil.saveToken(authenticationModel.token);

        // Set token to client
        apiClient.setToken(authenticationModel.token);
      } else {
        // Throw Role error if User doesn't login with Staff role
        throw Exception(StringUtil.ROLE_ERROR);
      }
    } else {
      // Login Failed
      throw Exception(authenticationModel.message);
    }
  }

  // Load Previous Login
  Future<void> loadPreviousLogin() async {
    try {
      // Load token on local
      String token = await FunctionUtil.loadToken();
      print('Token: $token');

      AuthenticationModel authenticationModel = AuthenticationModel.empty;

      // Check token
      if (FunctionUtil.checkToken(token)) {
        // Token is valid => Add authen
        authenticationModel = AuthenticationModel.fromToken(token);

        // Set token to client
        apiClient.setToken(token);
      } else {
        // Remove token
        FunctionUtil.removeToken();
      }
      _controller.add(authenticationModel);
    } catch (e) {
      print('Authentication Repository - Load Previous Login: ${e.toString()}');
    }
  }

  // Logout
  Future<void> logout() async {
    // Remove current authen
    _controller.add(AuthenticationModel.empty);
    apiClient.setToken('');

    // Remove token
    FunctionUtil.removeToken();
  }
}
