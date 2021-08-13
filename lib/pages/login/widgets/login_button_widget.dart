/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/pages/login/cubits/cubits.dart';
import 'package:sts/utils/utils.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ButtonCustomWidget(
          color: Get.theme.primaryColor,
          margin: EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          onPressed: state.status.isValidated
              ? () {
                  FocusScope.of(context).unfocus();
                  context.read<LoginCubit>().loginSubmitted();
                }
              : null,
          child: Text(
            StringUtil.LOGIN_BUTTON,
            style: Get.textTheme.button.copyWith(color: Get.theme.cardColor),
          ),
        );
      },
    );
  }
}
