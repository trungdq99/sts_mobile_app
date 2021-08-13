/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/pages/login/cubits/cubits.dart';
import 'package:sts/utils/utils.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
