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

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  final SkillsRepository _skillRepository;
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<List<SkillModel>> _listSkillsSubcription;
  SkillsBloc({
    @required SkillsRepository skillRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : _skillRepository = skillRepository,
        _authenticationRepository = authenticationRepository,
        super(SkillsState()) {
    _listSkillsSubcription = _skillRepository.listSkills
        .listen((event) => add(SkillsEventChanged(listSkills: event)));
  }

  @override
  Future<void> close() {
    _listSkillsSubcription?.cancel();
    _skillRepository?.dispose();
    return super.close();
  }

  @override
  Stream<SkillsState> mapEventToState(
    SkillsEvent event,
  ) async* {
    if (event is SkillsEventChanged) {
      yield* _mapChangedToState(event);
    } else if (event is SkillsEventGet) {
      yield* _mapGetToState(event);
    }
  }

  Stream<SkillsState> _mapChangedToState(
    SkillsEventChanged event,
  ) async* {
    if (event.listSkills != null) {
      yield state.copyWith(
        status: SkillsStatus.loading,
      );
      yield state.copyWith(
        listSkills: event.listSkills,
        status: SkillsStatus.loadingSuccessful,
      );
    } else {
      yield state.copyWith(
        status: SkillsStatus.loadingFailure,
        message: StringUtil.DEFAULT_ERROR,
      );
    }
  }

  // Map Load Brand to state
  Stream<SkillsState> _mapGetToState(SkillsEventGet event) async* {
    // Change to loading status
    yield state.copyWith(status: SkillsStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      await _skillRepository.getSkills();
      yield state.copyWith(
        message: 'Load successful!',
      );
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('SkillsBloc - _mapGetToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: SkillsStatus.loadingFailure,
        message: error,
      );
    }
  }
}
