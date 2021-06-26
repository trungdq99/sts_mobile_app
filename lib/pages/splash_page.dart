/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/authentication/authentication_bloc.dart';
import 'package:sts/custom_widget/logo_custom_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/custom_widget/progressing_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/space_util.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context
        .read<AuthenticationBloc>()
        .add(AuthenticationEventLoadPreviousLogin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ColorUtil.GRADIENT_BLUE,
          stops: [
            0,
            0.4,
            0.8,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoCustomWidget(
              isColorful: false,
            ),
            SpaceUtil.verticalDefault(),
            ProgressingCustomWidget(
              color: ColorUtil.WHITE,
            ),
          ],
        ),
      ),
    );
  }
}
