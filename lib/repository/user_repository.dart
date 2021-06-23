import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sts/constant.dart';
import 'package:sts/custom_widget/notification_dialog_custom_widget.dart';
import 'package:sts/models/user_model.dart';
import 'package:sts/utils/function_util.dart';
import 'package:sts/utils/response_status_util.dart';
import 'package:sts/utils/string_util.dart';
import 'package:sts/utils/url_util.dart';
import 'api_client.dart';
import 'authentication_repository.dart';

class UserRepository {
  final AuthenticationRepository _authenticationRepository;
  UserRepository({@required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  // Get user
  Future<UserModel> getUser() async {
    UserModel userModel = UserModel.empty;

    // Call Get User Api
    Response response = await apiClient.fetchData(
      api: UrlUtil.USER,
      method: RequestMethod.GET,
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      // Convert response body to User Model
      final json = response.body;
      userModel = UserModel.fromJson(json);
    } else if (status == ResponseStatusUtil.UNAUTHENTICATED) {
      Get.dialog(NotificationDialogCustomWidget(
        text: StringUtil.EXPIRED_LOGIN,
        onConfirm: () {
          _authenticationRepository.logout();
        },
        isPop: false,
      ));
    }

    return userModel;
  }
}
