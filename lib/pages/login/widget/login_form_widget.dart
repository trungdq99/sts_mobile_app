import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/pages/login/cubit/login_cubit.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _usernameInput(),
        SizedBox(
          height: 10,
        ),
        _passwordInput(),
        SizedBox(
          height: 20,
          child: BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              if (state.status.isSubmissionFailure) {
                return Text(
                  state.message,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                );
              } else if (state.status.isSubmissionSuccess) {
                return Text(
                  'Login Successful!',
                  style: TextStyle(
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
    // return TextField(
    //   decoration: InputDecoration(
    //     hintText: 'Email',
    //     border: OutlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //       ),
    //     ),
    //   ),
    // );
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          // key: const Key('loginForm_emailInput_textField'),
          onChanged: (username) =>
              context.read<LoginCubit>().usernameChanged(username),
          decoration: InputDecoration(
            hintText: 'Username',
            helperText: '',
            errorText: state.username.invalid ? 'invalid username' : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _passwordInput() {
    // return TextField(
    //   obscureText: true,
    //   decoration: InputDecoration(
    //     hintText: 'Password',
    //     border: OutlineInputBorder(),
    //   ),
    // );
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          // key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          // obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
            helperText: '',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }

  Widget _loginButton() {
    // return OutlinedButton(
    //   child: const Text(
    //     'Login',
    //   ),
    //   onPressed: () {
    //     // Get.offAndToNamed(RouteUtil.MAIN);
    //   },
    // );
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : OutlinedButton(
                child: const Text(
                  'Login',
                ),
                onPressed: state.status.isValidated
                    ? () {
                        FocusScope.of(context).unfocus();
                        context.read<LoginCubit>().loginSubmitted();
                      }
                    : null,
              );
      },
    );
  }
}
