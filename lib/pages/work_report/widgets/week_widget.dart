/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/cubits/cubits.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/utils/utils.dart';

class WeekWidget extends StatelessWidget {
  const WeekWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              BlocProvider.of<SelectedWeekCubit>(context).movePrevWeek();
            },
            margin: EdgeInsets.all(0),
            child: Icon(
              FontAwesomeIcons.chevronLeft,
              color: Get.theme.primaryColor,
              size: 20,
            ),
          ),
          BlocConsumer<SelectedWeekCubit, DateTimeRange>(
            listenWhen: (previous, current) => !DateTimeUtil.isSameWeek(
              previous,
              current,
            ),
            listener: (context, state) {
              BlocProvider.of<ShiftAttendanceBloc>(context)
                  .add(ShiftAttendanceEventGet(selectedWeek: state));
            },
            builder: (context, state) {
              return ContainerCustomWidget(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Get.theme.primaryColor,
                child: Row(
                  children: [
                    Text(
                      DateTimeUtil.convertDateTimeToString(
                        dateTime: state.start,
                        format: DateTimeUtil.DMY,
                      ),
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
                      DateTimeUtil.convertDateTimeToString(
                        dateTime: state.end,
                        format: DateTimeUtil.DMY,
                      ),
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
              BlocProvider.of<SelectedWeekCubit>(context).moveNextWeek();
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
