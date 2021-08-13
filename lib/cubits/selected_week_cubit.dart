/*
 * Author: Trung Shin
 */

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sts/utils/utils.dart';

class SelectedWeekCubit extends Cubit<DateTimeRange> {
  SelectedWeekCubit() : super(DateTimeUtil.getWeek(DateTime.now()));

  void moveNextWeek() {
    emit(DateTimeUtil.getNextWeek(state.start));
  }

  void movePrevWeek() {
    emit(DateTimeUtil.getPrevWeek(state.start));
  }

  void moveCurWeek() {
    emit(DateTimeUtil.getWeek(DateTime.now()));
  }
}
