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

class UserRepository {
  UserRepository();

  // Use controller to track user model changed
  final StreamController<UserModel> _controller = StreamController<UserModel>();

  //
  Stream<UserModel> get user async* {
    yield* _controller.stream;
  }

  void dispose() => _controller.close();

  // Get user
  Future<void> getUser() async {
    // Call Get User Api
    Response response = await apiClient.fetchData(
      api: UrlUtil.GET_USER,
      method: RequestMethod.GET,
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      // Convert response body to User Model
      final json = response.body;
      UserModel userModel = UserModel.fromJson(json);
      _controller.add(userModel);
    } else if (status == ResponseStatusUtil.UNAUTHENTICATED) {
      throw Exception(status);
    }
  }

  // Update user
  Future<void> updateUser({@required UserModel userModel}) async {
    // Call Update User Api
    Response response = await apiClient.fetchData(
      api: UrlUtil.UPDATE_USER,
      method: RequestMethod.PUT,
      body: userModel.toJson(),
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      // Change result to True
      _controller.add(userModel);
    } else if (status == ResponseStatusUtil.UNAUTHENTICATED) {
      throw Exception(status);
    }
  }
}
