/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/pages/login/widgets/widgets.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';
import 'cubits/cubits.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<AuthenticationRepository>()),
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SpaceUtil.verticalBig(),
                      LogoCustomWidget(),
                      SpaceUtil.verticalDefault(),
                      UsernameWidget(),
                      PasswordWidget(),
                      LoginMessageWidget(),
                      LoginButtonWidget(),
                      ForgotPasswordButtonWidget(),
                    ],
                  ),
                ),
                _progressing(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _progressing() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? FullScreenProgressingCustomWidget()
            : SizedBox();
      },
    );
  }
}
