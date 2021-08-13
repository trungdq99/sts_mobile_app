/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/cubits/cubits.dart';
import 'package:sts/pages/main/tab/schedule/widget/widgets.dart';

class ListShiftAssignmentWidget extends StatelessWidget {
  const ListShiftAssignmentWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedWeekCubit, DateTimeRange>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Row(
              children: [
                for (int i = 0; i < 7; i++)
                  Expanded(
                    child: ShiftAssignmentWidget(
                      dateTime: state.start.add(
                        Duration(
                          days: i,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
