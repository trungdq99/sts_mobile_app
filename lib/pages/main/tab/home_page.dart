/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/user/user_bloc.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/custom_widget/circle_avatar_custom_widget.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/custom_widget/image_network_custom_widget.dart';
import 'package:sts/custom_widget/progressing_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/route_util.dart';
import 'package:sts/utils/space_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInfo(),
            SpaceUtil.verticalSmall(),
            _buildAttendance(),
            SpaceUtil.verticalDefault(),
            _buildTotal(),
            SpaceUtil.verticalDefault(),
            _buildUpcomingShift(),
            SpaceUtil.verticalDefault(),
            _buildAvailableShift(),
          ],
        ),
      ),
    );
  }

  Widget _buildTotal() {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      onPressed: () {
        Get.toNamed(RouteUtil.TIMESHEET);
      },
      child: Row(
        children: [
          CircleAvatarCustomWidget(
            child: Icon(
              FontAwesomeIcons.clock,
              color: Get.theme.primaryColor,
              size: 20,
            ),
          ),
          SpaceUtil.horizontalDefault(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tổng giờ công tuần này:',
                  style: Get.textTheme.button,
                ),
                Text(
                  '24 giờ 23 phút',
                  style: Get.textTheme.bodyText2,
                ),
              ],
            ),
          ),
          Icon(
            FontAwesomeIcons.chevronRight,
            color: Get.theme.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildAttendance() {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      onPressed: () {},
      child: Row(
        children: [
          CircleAvatarCustomWidget(
            child: Icon(
              FontAwesomeIcons.calendarCheck,
              color: Get.theme.accentColor,
              size: 20,
            ),
          ),
          SpaceUtil.horizontalDefault(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lần cuối điểm danh:',
                  style: Get.textTheme.button,
                ),
                Text(
                  'Today - 14:00',
                  style: Get.textTheme.bodyText2,
                ),
              ],
            ),
          ),
          Icon(
            FontAwesomeIcons.chevronRight,
            color: Get.theme.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableShift() {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      onPressed: () {
        Get.toNamed(
          RouteUtil.SHIFT_DETAIL,
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ca còn trống',
                  style: Get.textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.calendar,
                  text: '20 Jun 2021, 14:00 - 19:00',
                  iconColor: ColorUtil.BLUE1,
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.mapMarkerAlt,
                  text: 'Passio Coffee FPTU',
                  iconColor: ColorUtil.BLUE2,
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.tag,
                  text: 'Pha chế',
                  iconColor: ColorUtil.BLUE3,
                ),
              ],
            ),
          ),
          Icon(
            FontAwesomeIcons.chevronRight,
            color: Get.theme.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingShift() {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      onPressed: () {
        Get.toNamed(
          RouteUtil.SHIFT_DETAIL,
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ca tiếp theo:',
                  style: Get.textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.calendar,
                  text: 'Today 14:00 - 19:00',
                  iconColor: ColorUtil.BLUE1,
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.mapMarkerAlt,
                  text: 'Passio Coffee FPTU',
                  iconColor: ColorUtil.BLUE2,
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.tag,
                  text: 'Pha chế',
                  iconColor: ColorUtil.BLUE3,
                ),
              ],
            ),
          ),
          Icon(
            FontAwesomeIcons.chevronRight,
            color: Get.theme.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
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
