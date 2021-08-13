/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/custom_widget/custom_widget.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        Widget title = SizedBox();
        Widget leading = ImageNetworkCustomWidget(
          imgUrl: '',
        );
        if (state.status == UserStatus.loadingSuccessful) {
          title = Text(
            '${state.userModel.firstName} ${state.userModel.lastName}',
            style: Get.textTheme.headline6,
          );
          leading = ImageNetworkCustomWidget(
            imgUrl: state.userModel.photoUrl,
          );
        } else if (state.status == UserStatus.loading) {
          title = ProgressingCustomWidget(
            type: ProcessingType.text,
          );
          leading = ProgressingCustomWidget(
            color: Get.theme.backgroundColor,
            circleSize: 20,
          );
        }

        return ListTile(
          leading: ContainerCustomWidget(
            boxShape: NeumorphicBoxShape.circle(),
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            color: Get.theme.primaryColor,
            height: 50,
            width: 50,
            child: leading,
          ),
          title: title,
          contentPadding: EdgeInsets.all(0),
        );
      },
    );
  }
}
