/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/utils/utils.dart';

class ForgotPasswordButtonWidget extends StatelessWidget {
  const ForgotPasswordButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        StringUtil.FORGOT_PASSWORD_BUTTON,
        style: Get.textTheme.button.copyWith(
          color: Get.theme.primaryColor,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
