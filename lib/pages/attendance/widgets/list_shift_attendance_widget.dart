/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/pages/attendance/widgets/widgets.dart';
import 'package:sts/utils/utils.dart';

class ListShiftAttendanceWidget extends StatelessWidget {
  const ListShiftAttendanceWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftAttendanceBloc, ShiftAttendanceState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < state.listShiftAttendance.length; i++)
                AttendanceWidget(
                    shiftAttendanceModel: state.listShiftAttendance[i]),
              SpaceUtil.verticalBig(),
            ],
          ),
        );
      },
    );
  }
}
