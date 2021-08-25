/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/authentication/authentication_bloc.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/blocs/user/user_bloc.dart';
import 'package:sts/cubits/cubits.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/custom_widget/circle_avatar_custom_widget.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/custom_widget/image_network_custom_widget.dart';
import 'package:sts/custom_widget/progressing_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/route_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/utils/space_util.dart';
import 'package:sts/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfo(),
            SpaceUtil.verticalBig(),
            // _buildTimeOfWork(),
            // SpaceUtil.verticalSmall(),
            // _buildRank(),
            // SpaceUtil.verticalDefault(),
            _buildUpcomingShift(),
            SpaceUtil.verticalDefault(),
            _buildWorkReport(),
            SpaceUtil.verticalDefault(),
            _buildAttendanceReport(),
            SpaceUtil.verticalBig(),
            // _buildLeave(),
            // SpaceUtil.verticalDefault(),
            // _buildUnavailability(),
            // SpaceUtil.verticalBig(),
            _buildEditProfileButton(),
            SpaceUtil.verticalDefault(),
            _buildJobInfoButton(),
            SpaceUtil.verticalDefault(),
            _buildChangePasswordButton(),
            SpaceUtil.verticalDefault(),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUnavailability() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {},
      child: ListTile(
        leading: CircleAvatarCustomWidget(
          color: ColorUtil.BLUE2,
          padding: EdgeInsets.all(5),
          child: Icon(
            FontAwesomeIcons.calendarTimes,
            color: Get.theme.backgroundColor,
          ),
        ),
        title: Text(
          'Ngày không thể làm',
          style: Get.textTheme.button,
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildLeave() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {},
      child: ListTile(
        leading: CircleAvatarCustomWidget(
          color: ColorUtil.BLUE2,
          padding: EdgeInsets.all(5),
          child: Icon(
            FontAwesomeIcons.calendarMinus,
            color: Get.theme.backgroundColor,
          ),
        ),
        title: Text(
          'Xin nghỉ',
          style: Get.textTheme.button,
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildUpcomingShift() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {
        BlocProvider.of<SelectedIndexCubit>(context).emit(1);
      },
      child: ListTile(
        leading: CircleAvatarCustomWidget(
          color: ColorUtil.BLUE1,
          padding: EdgeInsets.all(5),
          child: Icon(
            FontAwesomeIcons.calendarAlt,
            color: Get.theme.backgroundColor,
          ),
        ),
        title: Text(
          'Upcoming shift',
          style: Get.textTheme.button,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<ShiftAssignmentBloc, ShiftAssignmentState>(
              builder: (context, state) {
                if (state.status == ShiftAssignmentStatus.loading) {
                  return ProgressingCustomWidget();
                } else {
                  int count = 0;
                  if (state.listCurWeekShiftAssignments.isNotEmpty) {
                    int index = state.listCurWeekShiftAssignments
                        .lastIndexWhere((element) => DateTime.now()
                                .isBefore(DateTimeUtil.convertStringToDateTime(
                              dateStr: element.timeStart,
                              format: DateTimeUtil.YMDhms,
                            )));
                    if (index >= 0) {
                      count = index + 1;
                    }
                  }

                  return ContainerCustomWidget(
                    isUp: false,
                    boxShape: NeumorphicBoxShape.circle(),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(0),
                    child: Text(
                      count.toString(),
                      style: Get.textTheme.bodyText1.copyWith(
                        color: Get.theme.accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
              },
            ),
            SpaceUtil.horizontalDefault(),
            Icon(
              FontAwesomeIcons.chevronRight,
              color: Get.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkReport() {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      onPressed: () {},
      child: ListTile(
        leading: CircleAvatarCustomWidget(
          color: ColorUtil.BLUE1,
          padding: EdgeInsets.all(5),
          child: Icon(
            FontAwesomeIcons.calendarWeek,
            color: Get.theme.backgroundColor,
          ),
        ),
        title: Text(
          'Work report',
          style: Get.textTheme.button,
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildAttendanceReport() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {},
      child: ListTile(
        leading: CircleAvatarCustomWidget(
          color: ColorUtil.BLUE1,
          padding: EdgeInsets.all(5),
          child: Icon(
            FontAwesomeIcons.calendarCheck,
            color: Get.theme.backgroundColor,
          ),
        ),
        title: Text(
          'Attendance report',
          style: Get.textTheme.button,
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return ButtonCustomWidget(
      color: Get.theme.primaryColor,
      onPressed: () {
        context.read<AuthenticationBloc>().add(AuthenticationEventLogout());
      },
      child: Text(
        'Logout',
        style: Get.textTheme.button.copyWith(
          color: Get.theme.backgroundColor,
        ),
      ),
    );
  }

  Widget _buildChangePasswordButton() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {
        Get.toNamed(RouteUtil.CHANGE_PASSWORD);
      },
      child: ListTile(
        leading: CircleAvatarCustomWidget(
          color: ColorUtil.BLUE3,
          padding: EdgeInsets.all(5),
          child: Icon(
            FontAwesomeIcons.lock,
            color: Get.theme.backgroundColor,
          ),
        ),
        title: Text(
          'Change password',
          style: Get.textTheme.button,
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildJobInfoButton() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {
        Get.toNamed(RouteUtil.JOB_INFO);
      },
      child: ListTile(
        leading: CircleAvatarCustomWidget(
          color: ColorUtil.BLUE3,
          padding: EdgeInsets.all(5),
          child: Icon(
            FontAwesomeIcons.briefcase,
            color: Get.theme.backgroundColor,
          ),
        ),
        title: Text(
          'Job information',
          style: Get.textTheme.button,
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {
        Get.toNamed(RouteUtil.EDIT_PROFILE);
      },
      child: ListTile(
        leading: CircleAvatarCustomWidget(
          color: ColorUtil.BLUE3,
          padding: EdgeInsets.all(5),
          child: Icon(
            FontAwesomeIcons.solidUser,
            color: Get.theme.backgroundColor,
          ),
        ),
        title: Text(
          'Edit profile',
          style: Get.textTheme.button,
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildRank() {
    return IconTextCustomWidget(
      icon: FontAwesomeIcons.hashtag,
      text: 'Top 1 at Passio Coffee FPTU',
      textStyle: Get.textTheme.bodyText1.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTimeOfWork() {
    return IconTextCustomWidget(
      icon: FontAwesomeIcons.solidHourglass,
      text: '1000 hours of work',
      textStyle: Get.textTheme.bodyText1.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInfo() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        Widget title = SizedBox();
        if (state.status == UserStatus.loadingSuccessful) {
          title = Text(
            '${state.userModel.firstName} ${state.userModel.lastName}',
            style: Get.textTheme.headline6,
          );
        } else if (state.status == UserStatus.loading) {
          title = ProgressingCustomWidget(
            type: ProcessingType.text,
          );
        }

        return ListTile(
          leading: ContainerCustomWidget(
            boxShape: NeumorphicBoxShape.circle(),
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            color: Get.theme.primaryColor,
            child: ImageNetworkCustomWidget(
              imgUrl: state.userModel.photoUrl,
              height: 50,
              width: 50,
            ),
          ),
          title: title,
          contentPadding: EdgeInsets.all(0),
        );
      },
    );
  }
}
