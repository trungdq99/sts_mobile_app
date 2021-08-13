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

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;
  final BrandRepository _brandRepository;
  final SkillsRepository _skillRepository;
  final StoresRepository _storeRepository;
  StreamSubscription<UserModel> _userSubscription;
  UserBloc({
    @required UserRepository userRepository,
    @required AuthenticationRepository authenticationRepository,
    @required BrandRepository brandRepository,
    @required SkillsRepository skillRepository,
    @required StoresRepository storeRepository,
  })  : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository,
        _brandRepository = brandRepository,
        _skillRepository = skillRepository,
        _storeRepository = storeRepository,
        super(UserState()) {
    _userSubscription = _userRepository.user.listen(
      (status) => add(UserEventChange(userModel: status)),
    );
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _authenticationRepository?.dispose();
    _userRepository?.dispose();
    return super.close();
  }

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserEventChange) {
      yield* _mapUserChangedToState(event);
    } else if (event is UserEventGet) {
      yield* _mapGetToState(event);
    } else if (event is UserEventUpdate) {
      yield* _mapUpdateToState(event);
    }
  }

  Stream<UserState> _mapUserChangedToState(
    UserEventChange event,
  ) async* {
    if (event.userModel != UserModel.empty) {
      yield state.copyWith(
        status: UserStatus.loading,
      );
      // Load brand
      _brandRepository.getBrand(
        id: event.userModel.brandId,
      );

      // Load skills
      _skillRepository.getSkills();

      // Load stores
      _storeRepository.getStores();

      yield state.copyWith(
        userModel: event.userModel,
        status: UserStatus.loadingSuccessful,
      );
    } else {
      yield state.copyWith(
        status: UserStatus.loadingFailure,
        message: StringUtil.DEFAULT_ERROR,
      );
    }
  }

  // Map Load user to state
  Stream<UserState> _mapGetToState(UserEventGet event) async* {
    // Change to loading status
    yield state.copyWith(status: UserStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));

    try {
      await _userRepository.getUser();
      // yield state.copyWith(
      //   status: UserStatus.loadingSuccessful,
      // );
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('UserBloc - _mapGetToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: UserStatus.loadingFailure,
        message: error,
      );
    }
  }

  // Map Load user to state
  Stream<UserState> _mapUpdateToState(UserEventUpdate event) async* {
    // Change to loading status
    yield state.copyWith(status: UserStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));

    try {
      await _userRepository.updateUser(userModel: event.userModel);

      yield state.copyWith(
        status: UserStatus.loadingSuccessful,
        message: 'Update Profile successful!',
      );
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('UserBloc - _mapUpdateToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: UserStatus.loadingFailure,
        message: error,
      );
    }
  }
}
