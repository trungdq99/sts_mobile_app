/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/utils/utils.dart';

import 'widgets.dart';

class WorkReportWidget extends StatelessWidget {
  const WorkReportWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftAssignmentBloc, ShiftAssignmentState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '20 hrs 8 min / 20 hrs 0 min',
                style: Get.textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              SpaceUtil.verticalSmall(),
              for (int i = 0; i < state.listShiftAssignments.length; i++)
                ShiftWidget(
                    shiftAssignmentModel: state.listShiftAssignments[i]),
              SpaceUtil.verticalBig(),
            ],
          ),
        );
      },
    );
  }
}
