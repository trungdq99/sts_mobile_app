import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/logo_custom_widget.dart';
import 'package:sts/utils/route_util.dart';

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
                SizedBox(
                  height: 40,
                ),
                LogoCustomWidget(),
                SizedBox(
                  height: 20,
                ),
                LoginForm(),
                _forgotPasswordButton(),
                Divider(color: Colors.black,),
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
        ),
        _loginButton(),
      ],
    );
  }

  Widget _usernameInput() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _passwordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _loginButton() {
    return OutlinedButton(
      child: const Text('Login',),
      onPressed: () {
        Get.offAndToNamed(RouteUtil.MAIN);
      },
    );
  }
}
