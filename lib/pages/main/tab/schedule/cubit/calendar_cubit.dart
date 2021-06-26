/*
 * Author: Trung Shin
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarState.initial());

  void today() => emit(state.copyWith(
        selectedDay: DateTime.now(),
        focusedDay: DateTime.now(),
      ));

  void updateFormat({@required CalendarFormat format}) =>
      emit(state.copyWith(format: format));

  void updateDate({
    @required DateTime selectedDay,
    @required DateTime focusedDay,
  }) =>
      emit(state.copyWith(
        selectedDay: selectedDay,
        focusedDay: focusedDay,
      ));

  void updateFocusedDay({
    @required DateTime focusedDay,
  }) =>
      emit(state.copyWith(
        focusedDay: focusedDay,
      ));
}
