/*
 * Author: Trung Shin
 */

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sts/utils/date_time_util.dart';

class SelectWeekCubit extends Cubit<DateTimeRange> {
  SelectWeekCubit() : super(DateTimeUtil.getCurWeek(DateTime.now()));

  void moveNextWeek() {
    emit(DateTimeUtil.getNextWeek(state.start));
  }

  void movePrevWeek() {
    emit(DateTimeUtil.getPrevWeek(state.start));
  }

  void moveCurWeek() {
    emit(DateTimeUtil.getCurWeek(DateTime.now()));
  }
}
