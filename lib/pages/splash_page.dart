import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/authentication/authentication_bloc.dart';
import 'package:sts/custom_widget/logo_custom_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationBloc>().add(AuthenticationEventLoadPreviousLogin());
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoCustomWidget(),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
