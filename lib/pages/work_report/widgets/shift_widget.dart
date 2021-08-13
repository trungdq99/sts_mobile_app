/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/models/shift_assignment_model.dart';
import 'package:sts/utils/utils.dart';

class ShiftWidget extends StatelessWidget {
  final ShiftAssignmentModel shiftAssignmentModel;
  const ShiftWidget({
    Key key,
    @required this.shiftAssignmentModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonCustomWidget(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      radius: 10,
      alignment: Alignment.centerLeft,
      onPressed: () {},
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTextCustomWidget(
                  backgroundIconColor: ColorUtil.BLUE1,
                  icon: FontAwesomeIcons.calendar,
                  text: DateTimeUtil.convertDateTimeFormat(
                    dateStr: shiftAssignmentModel.timeCheckIn,
                    fromFormat: DateTimeUtil.YMDhms,
                    toFormat: DateTimeUtil.DMY,
                  ),
                  iconColor: ColorUtil.WHITE,
                ),
                SpaceUtil.verticalSmall(),
                Row(
                  children: [
                    Text(
                      'Shift: ',
                      style: Get.textTheme.bodyText2
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${DateTimeUtil.convertDateTimeFormat(
                        dateStr: shiftAssignmentModel.timeStart,
                        fromFormat: DateTimeUtil.YMDhms,
                        toFormat: DateTimeUtil.hm,
                      )} - ${DateTimeUtil.convertDateTimeFormat(
                        dateStr: shiftAssignmentModel.timeEnd,
                        fromFormat: DateTimeUtil.YMDhms,
                        toFormat: DateTimeUtil.hm,
                      )}',
                      style: Get.textTheme.bodyText2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Time work: ',
                      style: Get.textTheme.bodyText2
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${DateTimeUtil.convertDateTimeFormat(
                        dateStr: shiftAssignmentModel.timeCheckIn,
                        fromFormat: DateTimeUtil.YMDhms,
                        toFormat: DateTimeUtil.hm,
                      )} - ${DateTimeUtil.convertDateTimeFormat(
                        dateStr: shiftAssignmentModel.timeCheckOut,
                        fromFormat: DateTimeUtil.YMDhms,
                        toFormat: DateTimeUtil.hm,
                      )}',
                      style: Get.textTheme.bodyText2,
                    ),
                  ],
                ),
                SpaceUtil.verticalSmall(),
                IconTextCustomWidget(
                  backgroundIconColor: Get.theme.accentColor,
                  icon: FontAwesomeIcons.clock,
                  text: '${DateTimeUtil.dateTimeRangeToString(
                    DateTimeRange(
                      start: DateTimeUtil.convertStringToDateTime(
                        dateStr: shiftAssignmentModel.timeCheckIn,
                        format: DateTimeUtil.YMDhms,
                      ),
                      end: DateTimeUtil.convertStringToDateTime(
                        dateStr: shiftAssignmentModel.timeCheckOut,
                        format: DateTimeUtil.YMDhms,
                      ),
                    ),
                  )} / ${DateTimeUtil.dateTimeRangeToString(
                    DateTimeRange(
                      start: DateTimeUtil.convertStringToDateTime(
                        dateStr: shiftAssignmentModel.timeStart,
                        format: DateTimeUtil.YMDhms,
                      ),
                      end: DateTimeUtil.convertStringToDateTime(
                        dateStr: shiftAssignmentModel.timeEnd,
                        format: DateTimeUtil.YMDhms,
                      ),
                    ),
                  )}',
                  iconColor: ColorUtil.WHITE,
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
