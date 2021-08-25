/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/models/shift_assignment_model.dart';
import 'package:sts/utils/utils.dart';

class ShiftStatusWidget extends StatelessWidget {
  final ShiftAssignmentModel shiftAssignmentModel;

  const ShiftStatusWidget({
    Key key,
    @required this.shiftAssignmentModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String status = 'Not yet';
    Color color = ColorUtil.GREY;
    DateTime current = DateTime.now();
    DateTime timeStart = DateTimeUtil.convertStringToDateTime(
      dateStr: shiftAssignmentModel.timeStart,
      format: DateTimeUtil.YMDhms,
    );
    DateTime timeEnd = DateTimeUtil.convertStringToDateTime(
      dateStr: shiftAssignmentModel.timeEnd,
      format: DateTimeUtil.YMDhms,
    );
    DateTime timeCheckIn = DateTimeUtil.convertStringToDateTime(
      dateStr: shiftAssignmentModel.timeCheckIn,
      format: DateTimeUtil.YMDhms,
    );
    DateTime timeCheckOut = DateTimeUtil.convertStringToDateTime(
      dateStr: shiftAssignmentModel.timeCheckOut,
      format: DateTimeUtil.YMDhms,
    );
    if (current.isAfter(timeEnd)) {
      if (timeCheckIn.year != 1 && timeCheckOut.year != 1) {
        status = 'Present';
        color = ColorUtil.GREEN;
      } else if (timeCheckIn.year == 1 && timeCheckOut.year == 1) {
        status = 'Absent';
        color = ColorUtil.RED;
      } else {
        status = 'Pending';
        color = ColorUtil.ORANGE;
      }
    } else {
      if (current.isAfter(timeStart)) {
        status = 'Working';
        color = ColorUtil.YELLOW;
      }
    }
    return ContainerCustomWidget(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      margin: EdgeInsets.all(0),
      radius: 0,
      width: double.infinity,
      color: color,
      child: Text(
        status,
        style: Get.textTheme.caption.copyWith(
          color: ColorUtil.TEXT_COLOR_DARK,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
