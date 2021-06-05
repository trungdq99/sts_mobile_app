import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sts/custom_widget/logo_custom_widget.dart';
import 'package:sts/pages/login/cubit/login_cubit.dart';
import 'package:sts/repository/authentication_repository.dart';
import 'package:sts/utils/space_util.dart';

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
                  create: (context) => LoginCubit(context.read<AuthenticationRepository>()),
                  child: LoginForm(),
                ),
                _forgotPasswordButton(),
                Divider(
                  color: Colors.black,
                ),
                _loginWithText(),
                _buildGoogleButotn(),
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
      child: Text('Forgot password'),
    );
  }

  Widget _loginWithText() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text('or login with'),
    );
  }

  Widget _buildGoogleButotn() {
    return OutlinedButton(
      onPressed: () {},
      child: FaIcon(FontAwesomeIcons.google),
    );
  }
}
