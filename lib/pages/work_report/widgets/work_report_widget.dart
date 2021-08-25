/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              SpaceUtil.verticalSmall(),
              for (int i = 0; i < state.listShiftAssignments.length; i++)
                state.listShiftAssignments[i].timeCheckIn.contains('0001') ||
                        state.listShiftAssignments[i].timeCheckOut
                            .contains('0001')
                    ? SizedBox()
                    : ShiftWidget(
                        shiftAssignmentModel: state.listShiftAssignments[i]),
              SpaceUtil.verticalBig(),
            ],
          ),
        );
      },
    );
  }
}
