import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:sts/models/user_model.dart';
import 'package:sts/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc({@required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserState());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserEventLoad) {
      yield* _mapLoadToState(event);
    }
  }

  // Map Load user to state
  Stream<UserState> _mapLoadToState(UserEventLoad event) async* {
    // Change to loading status
    yield state.copyWith(loadStatus: LoadUserStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));

    try {
      UserModel userModel;
      userModel = await _userRepository.getUser();
      if (userModel != UserModel.empty) {
        yield state.copyWith(
          loadStatus: LoadUserStatus.loadingSuccessful,
          userModel: userModel,
        );
      } else {
        yield state.copyWith(loadStatus: LoadUserStatus.loadingFailure);
      }
    } catch (e) {
      print('Error at: UserBloc - _mapLoadToState: $e');
      yield state.copyWith(loadStatus: LoadUserStatus.loadingFailure);
    }
  }
}
