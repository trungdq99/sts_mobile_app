/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/pages/attendance/widgets/widgets.dart';
import 'package:sts/utils/utils.dart';

class ListShiftAttendanceWidget extends StatelessWidget {
  const ListShiftAttendanceWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftAttendanceBloc, ShiftAttendanceState>(
      builder: (context, state) {
        if (state.listShiftAttendance.isNotEmpty) {
          return SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 100,
              ),
              children: List.generate(
                state.listShiftAttendance.length,
                (index) => AttendanceWidget(
                    shiftAttendanceModel: state.listShiftAttendance[index]),
              ),
            ),
          );
        } else {
          return SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 100,
              ),
              children: [
                Text(
                  'No attendance this week!',
                  style: Get.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        // return SingleChildScrollView(
        //   padding: EdgeInsets.all(20),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       for (int i = 0; i < state.listShiftAttendance.length; i++)
        //         AttendanceWidget(
        //             shiftAttendanceModel: state.listShiftAttendance[i]),
        //       SpaceUtil.verticalBig(),
        //     ],
        //   ),
        // );
      },
    );
  }
}
