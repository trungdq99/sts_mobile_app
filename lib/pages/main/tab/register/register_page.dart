/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/cubits/select_week_cubit.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/pages/main/tab/register/register_list_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/date_time_util.dart';
import 'package:sts/utils/space_util.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: Text(
          'Đăng ký',
          style: Get.textTheme.headline6,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegisterListWidget(
                  listTimeWorks: [],
                ),
                SpaceUtil.verticalBig(),
                SpaceUtil.verticalBig(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: _buildDates(),
          ),
        ],
      ),
    );
  }

  Widget _buildDates() {
    return ContainerCustomWidget(
      width: Get.width,
      isUp: false,
      radius: 0,
      margin: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonCustomWidget(
            boxShape: NeumorphicBoxShape.circle(),
            onPressed: () {
              BlocProvider.of<SelectWeekCubit>(context).movePrevWeek();
            },
            margin: EdgeInsets.all(0),
            child: Icon(
              FontAwesomeIcons.chevronLeft,
              color: Get.theme.primaryColor,
              size: 20,
            ),
          ),
          BlocBuilder<SelectWeekCubit, DateTimeRange>(
            builder: (context, state) {
              return ContainerCustomWidget(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Get.theme.primaryColor,
                child: Row(
                  children: [
                    Text(
                      DateTimeUtil.convertDateString(state.start),
                      style: Get.textTheme.button.copyWith(
                        color: ColorUtil.TEXT_COLOR_DARK,
                      ),
                    ),
                    Text(
                      ' | ',
                      style: Get.textTheme.headline6.copyWith(
                        color: Get.theme.accentColor,
                      ),
                    ),
                    Text(
                      DateTimeUtil.convertDateString(state.end),
                      style: Get.textTheme.button.copyWith(
                        color: ColorUtil.TEXT_COLOR_DARK,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ButtonCustomWidget(
            boxShape: NeumorphicBoxShape.circle(),
            onPressed: () {
              BlocProvider.of<SelectWeekCubit>(context).moveNextWeek();
            },
            margin: EdgeInsets.all(0),
            child: Icon(
              FontAwesomeIcons.chevronRight,
              color: Get.theme.primaryColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
