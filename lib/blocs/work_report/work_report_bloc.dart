import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sts/models/models.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';

part 'work_report_event.dart';
part 'work_report_state.dart';

class WorkReportBloc extends Bloc<WorkReportEvent, WorkReportState> {
  final WorkReportRepository _workReportRepository;
  final AuthenticationRepository _authenticationRepository;
  WorkReportBloc({
    @required WorkReportRepository workReportRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : _workReportRepository = workReportRepository,
        _authenticationRepository = authenticationRepository,
        super(WorkReportState());

  @override
  Stream<WorkReportState> mapEventToState(
    WorkReportEvent event,
  ) async* {
    if (event is WorkReportEventGet) {
      yield* _mapGetToState(event);
    }
  }

  // Map Load Brand to state
  Stream<WorkReportState> _mapGetToState(WorkReportEventGet event) async* {
    // Change to loading status
    yield state.copyWith(status: WorkReportStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      WorkReportModel workReportModel;
      workReportModel = await _workReportRepository.getShiftAttendance(
        selectedWeek: event.selectedWeek,
      );
      if (workReportModel != null) {
        yield state.copyWith(
          workReportModel: workReportModel,
          status: WorkReportStatus.loadingSuccessful,
          message: 'Load successful!',
        );
      }
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('WorkReportBloc - _mapGetToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: WorkReportStatus.loadingFailure,
        message: error,
      );
    }
  }
}
