/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sts/pages/login/cubits/cubits.dart';
import 'package:formz/formz.dart';

class LoginMessageWidget extends StatelessWidget {
  const LoginMessageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 20,
      child: BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          if (state.status.isSubmissionFailure) {
            return Text(
              state.message,
              style: Get.textTheme.bodyText1.copyWith(
                color: Colors.red,
              ),
            );
          } else if (state.status.isSubmissionSuccess) {
            return Text(
              'Login Successful!',
              style: Get.textTheme.bodyText1.copyWith(
                color: Colors.green,
              ),
            );
          }
          return Text(
            '',
          );
        },
      ),
    );
  }
}
