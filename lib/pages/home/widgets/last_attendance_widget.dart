/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/models/shift_attendance_model.dart';
import 'package:sts/utils/utils.dart';

class LastAttendanceWidget extends StatefulWidget {
  const LastAttendanceWidget({Key key}) : super(key: key);

  @override
  _LastAttendanceWidgetState createState() => _LastAttendanceWidgetState();
}

class _LastAttendanceWidgetState extends State<LastAttendanceWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftAttendanceBloc, ShiftAttendanceState>(
      builder: (context, state) {
        if (state.status == ShiftAttendanceStatus.loadingSuccessful &&
            state.listShiftAttendance.isNotEmpty) {
          return _buildAttendance(state.listShiftAttendance[0]);
        } else if (state.status == ShiftAttendanceStatus.loading) {
          return _buildLoading();
        } else {
          return _buildEmpty();
        }
      },
    );
  }

  routeToAttendance() => Get.toNamed(RouteUtil.ATTENDANCE,
      arguments: BlocProvider.of<ShiftAttendanceBloc>(context));

  ButtonCustomWidget _buildAttendance(
      ShiftAttendanceModel shiftAttendanceModel) {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      onPressed: () {
        routeToAttendance();
      },
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
                  StringUtil.LAST_ATTENDANCE,
                  style: Get.textTheme.button,
                ),
                Text(
                  '${DateTimeUtil.convertDateTimeFormat(
                    dateStr: shiftAttendanceModel.timeCheck,
                    fromFormat: DateTimeUtil.YMDhms,
                    toFormat: DateTimeUtil.DMY,
                  )}, ${DateTimeUtil.convertDateTimeFormat(
                    dateStr: shiftAttendanceModel.timeCheck,
                    fromFormat: DateTimeUtil.YMDhms,
                    toFormat: DateTimeUtil.hm,
                  )}',
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

  Widget _buildLoading() {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      onPressed: () {
        routeToAttendance();
      },
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
                  StringUtil.LAST_ATTENDANCE,
                  style: Get.textTheme.button,
                ),
                ProgressingCustomWidget(),
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

  Widget _buildEmpty() {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      onPressed: () {
        routeToAttendance();
      },
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
                  StringUtil.LAST_ATTENDANCE,
                  style: Get.textTheme.button,
                ),
                Text(
                  '',
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
}
