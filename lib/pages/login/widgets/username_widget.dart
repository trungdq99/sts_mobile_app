/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/pages/login/cubits/cubits.dart';
import 'package:sts/utils/utils.dart';

class UsernameWidget extends StatelessWidget {
  const UsernameWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
