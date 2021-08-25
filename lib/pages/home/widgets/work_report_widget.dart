/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/blocs/work_report/work_report_bloc.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/utils/utils.dart';

class WorkReportWidget extends StatelessWidget {
  const WorkReportWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      onPressed: () {
        Get.toNamed(
          RouteUtil.WORK_REPORT,
          arguments: BlocProvider.of<ShiftAssignmentBloc>(context),
        );
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
                  StringUtil.WORK_REPORT,
                  style: Get.textTheme.button,
                ),
                BlocBuilder<WorkReportBloc, WorkReportState>(
                  builder: (context, state) {
                    if (state.status == WorkReportStatus.loading) {
                      return ProgressingCustomWidget(
                        type: ProcessingType.text,
                      );
                    } else {
                      return Text(
                        '${state.workReportModel.hoursWorked} / ${state.workReportModel.hoursAssigned}',
                        style: Get.textTheme.bodyText2,
                      );
                    }
                  },
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
