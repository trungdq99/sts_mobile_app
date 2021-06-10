import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/full_screen_progressing_custom_widget.dart';
import 'package:sts/custom_widget/text_field_custom_widget.dart';
import 'package:sts/pages/login/cubit/login_cubit.dart';
import 'package:formz/formz.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/gradient_util.dart';
import 'package:sts/utils/space_util.dart';
import 'package:sts/utils/string_util.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _usernameInput(),
        SpaceUtil.verticalDefault(),
        _passwordInput(),
        SpaceUtil.verticalSmall(),
        Container(
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
        ),
        _loginButton(),
      ],
    );
  }

  Widget _usernameInput() {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextFieldCustomWidget(
          hintText: StringUtil.USERNAME_INPUT_HINT,
          maxLength: 50,
          maxLines: 1,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          errorText:
              state.username.invalid ? StringUtil.USERNAME_INPUT_ERROR : null,
          onChanged: (username) =>
              context.read<LoginCubit>().usernameChanged(username),
        );
      },
    );
  }

  Widget _passwordInput() {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFieldCustomWidget(
          hintText: StringUtil.PASSWORD_INPUT_HINT,
          obscureText: true,
          maxLines: 1,
          maxLength: 20,
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          errorText:
              state.password.invalid ? StringUtil.PASSWORD_INPUT_ERROR : null,
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSubmissionInProgress) {
          if (Get.isDialogOpen) Get.back();
          Get.dialog(FullScreenProgressingCustomWidget());
        } else {
          if (Get.isDialogOpen) {
            Get.back();
          }
        }
      },
      builder: (context, state) {
        return ButtonCustomWidget(
          color: Get.theme.primaryColor,
          onPressed: state.status.isValidated
              ? () {
                  FocusScope.of(context).unfocus();
                  context.read<LoginCubit>().loginSubmitted();
                }
              : null,
          child: Text(
            StringUtil.LOGIN_BUTTON,
            style: Get.textTheme.button.copyWith(
              color: Get.theme.backgroundColor,
            ),
          ),
        );
      },
    );
  }
}
