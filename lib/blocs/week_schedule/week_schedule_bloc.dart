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

part 'week_schedule_event.dart';
part 'week_schedule_state.dart';

class WeekScheduleBloc extends Bloc<WeekScheduleEvent, WeekScheduleState> {
  final WeekScheduleRepository _weekScheduleRepository;
  final AuthenticationRepository _authenticationRepository;

  WeekScheduleBloc(
      {@required WeekScheduleRepository weekScheduleRepository,
      @required AuthenticationRepository authenticationRepository})
      : _weekScheduleRepository = weekScheduleRepository,
        _authenticationRepository = authenticationRepository,
        super(WeekScheduleState());

  @override
  Stream<WeekScheduleState> mapEventToState(
    WeekScheduleEvent event,
  ) async* {
    if (event is WeekScheduleEventGet) {
      yield* _mapGetToState(event);
    }
  }

  // Map Load shift registers to state
  Stream<WeekScheduleState> _mapGetToState(WeekScheduleEventGet event) async* {
    // Change to loading status
    yield state.copyWith(status: WeekScheduleStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      WeekScheduleModel weekScheduleModel;
      weekScheduleModel = await _weekScheduleRepository.getWeekSchedule(
        selectedWeek: event.selectedWeek,
      );
      if (weekScheduleModel != null) {
        yield state.copyWith(
          status: WeekScheduleStatus.loadingSuccessful,
          message: 'Load successful!',
          weekScheduleModel: weekScheduleModel,
        );
      }
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('WeekScheduleBloc - _mapGetToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: WeekScheduleStatus.loadingFailure,
        message: error,
      );
    }
  }
}
