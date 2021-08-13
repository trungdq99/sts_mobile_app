/*
 * Author: Trung Shin
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/cubits/cubits.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/utils/utils.dart';
import 'widget/widgets.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  Completer<void> _refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: Text(
          StringUtil.SCHEDULE_PAGE_TITLE,
          style: Get.textTheme.headline6,
        ),
      ),
      body: BlocConsumer<ShiftAssignmentBloc, ShiftAssignmentState>(
        listener: (context, state) {
          if (state.status == ShiftAssignmentStatus.loadingSuccessful) {
            _refreshCompleter?.complete();
            _refreshCompleter = Completer();
          } else if (state.status == ShiftAssignmentStatus.loadingFailure) {
            if (Get.isDialogOpen) Get.back();
            Get.dialog(NotificationDialogCustomWidget(
              message: state.message,
              isPop: false,
            ));
          }
        },
        builder: (context, state) {
          return BlocBuilder<SelectedWeekCubit, DateTimeRange>(
            builder: (context, dateTimeRange) {
              return RefreshIndicator(
                color: Get.theme.primaryColor,
                onRefresh: () {
                  BlocProvider.of<ShiftAssignmentBloc>(context).add(
                      ShiftAssignmentEventGet(selectedWeek: dateTimeRange));
                  return _refreshCompleter.future;
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ListShiftAssignmentWidget(),
                    state.status == ShiftAssignmentStatus.loading
                        ? FullScreenProgressingCustomWidget()
                        : SizedBox(),
                    Positioned(
                      bottom: 0,
                      child: WeekWidget(),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
