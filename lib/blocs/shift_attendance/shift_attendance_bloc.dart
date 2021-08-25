/*
 * Author: Trung Shin
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sts/models/models.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';

part 'shift_attendance_event.dart';
part 'shift_attendance_state.dart';

class ShiftAttendanceBloc
    extends Bloc<ShiftAttendanceEvent, ShiftAttendanceState> {
  final ShiftAttendanceRepository _shiftAttendanceRepository;
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<List<ShiftAttendanceModel>>
      _listShiftAttendanceSubcription;

  ShiftAttendanceBloc({
    @required ShiftAttendanceRepository shiftAttendanceRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : _shiftAttendanceRepository = shiftAttendanceRepository,
        _authenticationRepository = authenticationRepository,
        super(ShiftAttendanceState()) {
    _listShiftAttendanceSubcription =
        _shiftAttendanceRepository.curWeekAttendance.listen((event) => add(
            ShiftAttendanceEventCurWeekChanged(listShiftAttendance: event)));
  }

  @override
  Future<void> close() {
    _listShiftAttendanceSubcription?.cancel();
    _shiftAttendanceRepository?.dispose();
    return super.close();
  }

  @override
  Stream<ShiftAttendanceState> mapEventToState(
    ShiftAttendanceEvent event,
  ) async* {
    if (event is ShiftAttendanceEventGet) {
      yield* _mapGetToState(event);
    } else if (event is ShiftAttendanceEventCurWeekChanged) {
      yield* _mapChangedToState(event);
    }
  }

  // Map Load shift registers to state
  Stream<ShiftAttendanceState> _mapGetToState(
      ShiftAttendanceEventGet event) async* {
    // Change to loading status
    yield state.copyWith(status: ShiftAttendanceStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));

    try {
      List<ShiftAttendanceModel> listAttendanceModel;
      // listAttendanceModel = [
      //   ShiftAttendanceModel(timeCheck: '2021-08-01T14:15:52.47')
      // ];
      listAttendanceModel = await _shiftAttendanceRepository.getShiftAttendance(
        selectedWeek: event.selectedWeek,
      );
      if (listAttendanceModel != null) {
        yield state.copyWith(
          status: ShiftAttendanceStatus.loadingSuccessful,
          message: 'Load successful!',
          listShiftAttendance: listAttendanceModel,
        );
      }
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('ShiftAttendanceBloc - _mapGetToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: ShiftAttendanceStatus.loadingFailure,
        message: error,
      );
    }
  }

  Stream<ShiftAttendanceState> _mapChangedToState(
    ShiftAttendanceEventCurWeekChanged event,
  ) async* {
    if (event.listShiftAttendance != null) {
      yield state.copyWith(
        status: ShiftAttendanceStatus.loading,
      );
      yield state.copyWith(
        listCurWeekShiftAttendance: event.listShiftAttendance,
        status: ShiftAttendanceStatus.loadingSuccessful,
      );
    } else {
      yield state.copyWith(
        status: ShiftAttendanceStatus.loadingFailure,
        message: StringUtil.DEFAULT_ERROR,
      );
    }
  }
}
