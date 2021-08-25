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

part 'shift_assignment_event.dart';
part 'shift_assignment_state.dart';

class ShiftAssignmentBloc
    extends Bloc<ShiftAssignmentEvent, ShiftAssignmentState> {
  final ShiftAssignmentRepository _shiftAssignmentRepository;
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<List<ShiftAssignmentModel>>
      _listShiftAssignmentSubcription;
  ShiftAssignmentBloc({
    @required ShiftAssignmentRepository shiftAssignmentRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : _shiftAssignmentRepository = shiftAssignmentRepository,
        _authenticationRepository = authenticationRepository,
        super(ShiftAssignmentState()) {
    _listShiftAssignmentSubcription =
        _shiftAssignmentRepository.curWeekAssignment.listen((event) => add(
            ShiftAssignmentEventCurWeekChanged(listShiftAssignment: event)));
  }

  @override
  Future<void> close() {
    _listShiftAssignmentSubcription?.cancel();
    _shiftAssignmentRepository?.dispose();
    return super.close();
  }

  @override
  Stream<ShiftAssignmentState> mapEventToState(
    ShiftAssignmentEvent event,
  ) async* {
    if (event is ShiftAssignmentEventGet) {
      yield* _mapGetToState(event);
    } else if (event is ShiftAssignmentEventCurWeekChanged) {
      yield* _mapChangedToState(event);
    }
  }

  // Map Load shift registers to state
  Stream<ShiftAssignmentState> _mapGetToState(
      ShiftAssignmentEventGet event) async* {
    // Change to loading status
    yield state.copyWith(status: ShiftAssignmentStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));

    try {
      List<ShiftAssignmentModel> listAssignmentModel;
      // listAssignmentModel = [
      //   ShiftAssignmentModel(
      //     timeStart: '2021-08-01T12:00:00',
      //     timeEnd: '2021-08-01T19:00:00',
      //     timeCheckIn: '2021-08-01T11:55:24',
      //     timeCheckOut: '2021-08-01T18:58:32',
      //   ),
      //   ShiftAssignmentModel(
      //     timeStart: '2021-07-27T07:00:00',
      //     timeEnd: '2021-07-27T13:00:00',
      //     timeCheckIn: '2021-07-27T07:01:20',
      //     timeCheckOut: '2021-07-27T13:00:45',
      //   ),
      //   ShiftAssignmentModel(
      //     timeStart: '2021-07-26T07:00:00',
      //     timeEnd: '2021-07-26T14:00:00',
      //     timeCheckIn: '2021-07-26T06:58:35',
      //     timeCheckOut: '2021-07-26T14:05:27',
      //   ),
      // ];
      listAssignmentModel =
          await _shiftAssignmentRepository.getShiftAssignments(
        selectedWeek: event.selectedWeek,
      );
      if (listAssignmentModel != null) {
        yield state.copyWith(
          status: ShiftAssignmentStatus.loadingSuccessful,
          message: 'Load successful!',
          listShiftAssignments: listAssignmentModel,
          selectedWeek: event.selectedWeek,
        );
      }
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('ShiftAssignmentBloc - _mapGetToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: ShiftAssignmentStatus.loadingFailure,
        message: error,
      );
    }
  }

  Stream<ShiftAssignmentState> _mapChangedToState(
    ShiftAssignmentEventCurWeekChanged event,
  ) async* {
    if (event.listShiftAssignment != null) {
      yield state.copyWith(
        status: ShiftAssignmentStatus.loading,
      );
      yield state.copyWith(
        status: ShiftAssignmentStatus.loadingSuccessful,
        listCurWeekShiftAssignments: event.listShiftAssignment,
      );
    } else {
      yield state.copyWith(
        status: ShiftAssignmentStatus.loadingFailure,
        message: StringUtil.DEFAULT_ERROR,
      );
    }
  }
}
