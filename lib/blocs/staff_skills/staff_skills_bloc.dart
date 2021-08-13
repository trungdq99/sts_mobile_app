/*
 * Author: Trung Shin
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:sts/models/models.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';

part 'staff_skills_event.dart';
part 'staff_skills_state.dart';

class StaffSkillsBloc extends Bloc<StaffSkillsEvent, StaffSkillsState> {
  final StaffSkillsRepository _staffSkillsRepository;
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<List<StaffSkillModel>> _staffSkillSubcription;

  StaffSkillsBloc({
    @required StaffSkillsRepository staffSkillsRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : _staffSkillsRepository = staffSkillsRepository,
        _authenticationRepository = authenticationRepository,
        super(StaffSkillsState()) {
    _staffSkillSubcription = _staffSkillsRepository.staffSkills.listen(
        (event) => add(StaffSkillsEventChange(listStaffSkillModel: event)));
  }

  @override
  Future<void> close() {
    _staffSkillSubcription?.cancel();
    _authenticationRepository?.dispose();
    _staffSkillsRepository?.dispose();
    return super.close();
  }

  @override
  Stream<StaffSkillsState> mapEventToState(
    StaffSkillsEvent event,
  ) async* {
    if (event is StaffSkillsEventChange) {
      yield* _mapChangedToState(event);
    } else if (event is StaffSkillsEventGet) {
      yield* _mapGetToState(event);
    }
  }

  Stream<StaffSkillsState> _mapChangedToState(
    StaffSkillsEventChange event,
  ) async* {
    if (event.listStaffSkillModel != null &&
        event.listStaffSkillModel.isNotEmpty) {
      yield state.copyWith(
        listStaffSkills: event.listStaffSkillModel,
        status: StaffSkillsStatus.loadingSuccessful,
      );
    } else {
      yield state.copyWith(
        status: StaffSkillsStatus.loadingFailure,
        message: StringUtil.DEFAULT_ERROR,
      );
    }
  }

  // Map Load Staff skills to state
  Stream<StaffSkillsState> _mapGetToState(StaffSkillsEventGet event) async* {
    // Change to loading status
    yield state.copyWith(status: StaffSkillsStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      await _staffSkillsRepository.getSkills();
      yield state.copyWith(
        message: 'Load successful!',
      );
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('StaffSkillsBloc - _mapGetToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: StaffSkillsStatus.loadingFailure,
        message: error,
      );
    }
  }
}
