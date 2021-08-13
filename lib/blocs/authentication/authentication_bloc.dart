/*
 * Author: Trung Shin
 */

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/notification/notification_bloc.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/models/models.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  final NotificationBloc _notificationBloc;
  StreamSubscription<AuthenticationModel> _authenticationSubscription;

  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
    @required UserRepository userRepository,
    @required NotificationBloc notificationBloc,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        _notificationBloc = notificationBloc,
        super(AuthenticationState()) {
    _authenticationSubscription =
        _authenticationRepository.authentication.listen(
      (status) => add(AuthenticationEventChanged(status)),
    );
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationEventChanged) {
      yield* _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationEventLoadPreviousLogin) {
      yield* _mapLoadPreviousLoginToState(event);
    } else if (event is AuthenticationEventLogout) {
      yield* _mapLogoutToState(event);
    } else if (event is AuthenticationEventUnknown) {
      yield AuthenticationState();
    }
  }

  @override
  Future<void> close() {
    _authenticationSubscription?.cancel();
    _authenticationRepository?.dispose();
    _userRepository?.dispose();
    return super.close();
  }

  Stream<AuthenticationState> _mapAuthenticationStatusChangedToState(
    AuthenticationEventChanged event,
  ) async* {
    if (event.authenticationModel == AuthenticationModel.empty) {
      _notificationBloc.unSubcribeToTopic(state.authenticationModel.username);
      yield AuthenticationState.unauthenticated();
    } else {
      try {
        // Load User
        _userRepository.getUser();
        _notificationBloc.subcribeToTopic(event.authenticationModel.username);
        yield AuthenticationState.authenticated(
            authenticationModel: event.authenticationModel);
      } catch (e) {
        String error = FunctionUtil.getException(e);
        if (error == ResponseStatusUtil.UNAUTHENTICATED) {
          FunctionUtil.handleUnauthentication(_authenticationRepository);
        } else {
          Get.dialog(NotificationDialogCustomWidget(
            message: 'Error: $error',
            isPop: false,
            onConfirm: () {
              _authenticationRepository.logout();
            },
          ));
        }
        print(
            'AuthenticationBloc - _mapAuthenticationStatusChangedToState: $error');
      }
    }
  }

  Stream<AuthenticationState> _mapLogoutToState(
      AuthenticationEventLogout event) async* {
    try {
      await _authenticationRepository.logout();
    } catch (e) {
      print('AuthenticationBloc - _mapLogoutToState: $e');
    }
  }

  Stream<AuthenticationState> _mapLoadPreviousLoginToState(
      AuthenticationEventLoadPreviousLogin event) async* {
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      await _authenticationRepository.loadPreviousLogin();
    } catch (e) {
      print(
          'AuthenticationBloc - _mapLoadPreviousLoginToState: ${e.toString()}');
    }
  }
}
