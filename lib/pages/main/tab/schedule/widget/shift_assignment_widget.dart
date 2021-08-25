/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/utils/utils.dart';

import 'widgets.dart';

class ShiftAssignmentWidget extends StatelessWidget {
  final DateTime dateTime;
  const ShiftAssignmentWidget({
    Key key,
    @required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerCustomWidget(
          margin: EdgeInsets.all(2),
          padding: EdgeInsets.all(5),
          width: double.maxFinite,
          radius: 5,
          isUp: !DateTimeUtil.isToday(dateTime: dateTime),
          color: DateTimeUtil.isToday(dateTime: dateTime)
              ? Get.theme.scaffoldBackgroundColor
              : Get.theme.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                DateTimeUtil.convertDateTimeToString(
                  dateTime: dateTime,
                  format: DateTimeUtil.D,
                ),
                style: Get.textTheme.button.copyWith(
                  color: DateTimeUtil.isToday(dateTime: dateTime)
                      ? Get.theme.accentColor
                      : Get.theme.primaryColor,
                ),
              ),
              Text(
                DateTimeUtil.convertDateTimeToString(
                  dateTime: dateTime,
                  format: DateTimeUtil.MMM,
                ),
                style: Get.textTheme.button.copyWith(
                  color: DateTimeUtil.isToday(dateTime: dateTime)
                      ? Get.theme.accentColor
                      : Get.theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
        ContainerCustomWidget(
          margin: EdgeInsets.all(2),
          padding: EdgeInsets.all(0),
          height: context.height,
          width: double.maxFinite,
          radius: 5,
          color: Get.theme.scaffoldBackgroundColor,
          isUp: !DateTimeUtil.isToday(dateTime: dateTime),
          child: BlocBuilder<ShiftAssignmentBloc, ShiftAssignmentState>(
            builder: (context, state) {
              // if (state.listShiftAssignments.length == 0)
              //   return Text('Empty');
              // else
              return Column(
                children: [
                  for (int i = state.listShiftAssignments.length - 1;
                      i >= 0;
                      i--)
                    DateTimeUtil.isSameDay(
                            date1: dateTime,
                            date2: DateTimeUtil.convertStringToDateTime(
                              dateStr: state.listShiftAssignments[i].timeEnd,
                              format: DateTimeUtil.YMDhms,
                            ))
                        ? ButtonCustomWidget(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 2,
                            ),
                            padding: EdgeInsets.all(0),
                            color: Get.theme.backgroundColor,
                            onPressed: () {
                              Get.toNamed(
                                RouteUtil.SHIFT_DETAIL,
                                arguments: state.listShiftAssignments[i],
                              );
                            },
                            radius: 5,
                            child: Column(
                              children: [
                                ShiftStatusWidget(
                                  shiftAssignmentModel:
                                      state.listShiftAssignments[i],
                                ),
                                SpaceUtil.verticalSmall(),
                                Text(
                                  '${DateTimeUtil.convertDateTimeFormat(
                                    dateStr:
                                        state.listShiftAssignments[i].timeStart,
                                    fromFormat: DateTimeUtil.YMDhms,
                                    toFormat: DateTimeUtil.hm,
                                  )}',
                                  style: Get.textTheme.button,
                                ),
                                Icon(
                                  FontAwesomeIcons.minus,
                                  color: Get.theme.accentColor,
                                ),
                                Text(
                                  '${DateTimeUtil.convertDateTimeFormat(
                                    dateStr:
                                        state.listShiftAssignments[i].timeEnd,
                                    fromFormat: DateTimeUtil.YMDhms,
                                    toFormat: DateTimeUtil.hm,
                                  )}',
                                  style: Get.textTheme.button,
                                ),
                                SpaceUtil.verticalSmall(),
                              ],
                            ),
                          )
                        : SizedBox(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
