/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/logo_custom_widget.dart';
import 'package:sts/pages/login/cubit/login_cubit.dart';
import 'package:sts/repository/authentication_repository.dart';
import 'package:sts/utils/space_util.dart';
import 'package:sts/utils/string_util.dart';
import 'widget/login_form_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SpaceUtil.verticalBig(),
                LogoCustomWidget(),
                SpaceUtil.verticalDefault(),
                BlocProvider(
                  create: (context) =>
                      LoginCubit(context.read<AuthenticationRepository>()),
                  child: LoginForm(),
                ),
                _forgotPasswordButton(),
                // Divider(
                //   color: Colors.black,
                // ),
                // _loginWithText(),
                // _buildGoogleButotn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordButton() {
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
