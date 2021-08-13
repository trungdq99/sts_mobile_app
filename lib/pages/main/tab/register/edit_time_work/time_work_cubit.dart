/*
 * Author: Trung Shin
 */

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class TimeWorkCubit extends Cubit<DateTimeRange> {
  TimeWorkCubit()
      : super(
          DateTimeRange(
            start: DateTime.now(),
            end: DateTime.now().add(
              Duration(
                hours: 1,
              ),
            ),
          ),
        );

  void setTime({
    @required DateTime timeStart,
    @required DateTime timeEnd,
  }) {
    if (timeEnd.isAfter(timeStart)) {
      emit(
        DateTimeRange(
          start: timeStart,
          end: timeEnd,
        ),
      );
    } else {
      emit(
        DateTimeRange(
          start: timeEnd,
          end: timeStart,
        ),
      );
    }
  }

  void setTimeStart({@required DateTime timeStart}) {
    if (timeStart.isBefore(state.end)) {
      emit(
        DateTimeRange(
          start: timeStart,
          end: state.end,
        ),
      );
    } else {
      if (timeStart.hour == 23 && timeStart.minute == 30) {
        return;
      } else {
        emit(
          DateTimeRange(
            start: timeStart,
            end: timeStart.add(Duration(
              minutes: 30,
            )),
          ),
        );
      }
    }
  }

  void setTimeEnd({@required DateTime timeEnd}) {
    if (timeEnd.isAfter(state.start)) {
      emit(
        DateTimeRange(
          start: state.start,
          end: timeEnd,
        ),
      );
    } else {
      if (timeEnd.hour == 0 && timeEnd.minute == 0) {
        return;
      } else {
        emit(
          DateTimeRange(
            start: timeEnd.subtract(Duration(
              minutes: 30,
            )),
            end: timeEnd,
          ),
        );
      }
    }
  }
}
