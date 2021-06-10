import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sts/models/authentication_model.dart';
import 'package:sts/repository/authentication_repository.dart';
import 'package:sts/utils/response_status_util.dart';

import '../../constant.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<AuthenticationModel> _authenticationSubscription;

  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(AuthenticationState()) {
    _authenticationSubscription =
        _authenticationRepository.authentication.listen(
      (status) => add(AuthenticationEventUserChanged(status)),
    );
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationEventUserChanged) {
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
    _authenticationSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  Stream<AuthenticationState> _mapAuthenticationStatusChangedToState(
    AuthenticationEventUserChanged event,
  ) async* {
    if (event.authenticationModel == AuthenticationModel.empty) {
      yield AuthenticationState.unauthenticated();
    } else {
      _saveToken(event.authenticationModel.token);
      yield AuthenticationState.authenticated(
          authenticationModel: event.authenticationModel);
    }
  }

  Stream<AuthenticationState> _mapLogoutToState(
      AuthenticationEventLogout event) async* {
    try {
      await _authenticationRepository.logout();
    } catch (e) {
      print('Error at: AuthenticationBloc - _mapLogoutToState: $e');
    }
    _removeToken();
    yield AuthenticationState.unauthenticated();
  }

  Stream<AuthenticationState> _mapLoadPreviousLoginToState(
      AuthenticationEventLoadPreviousLogin event) async* {
    String token;
    token = await _loadToken();
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      AuthenticationModel authenticationModel;
      if (token != null && token.isNotEmpty) {
        print('Token: $token');
        authenticationModel = AuthenticationModel(
          status: 200,
          token: token,
          username: 'hello',
        );
      }
      if (authenticationModel != null) {
        yield AuthenticationState.authenticated(
          authenticationModel: authenticationModel,
        );
      } else {
        yield AuthenticationState.unauthenticated();
      }
    } catch (e) {
      print('Error at: AuthenticationBloc - _mapLoadPreviousLoginToState: $e');
      if (e.toString() == 'Exception: ${ResponseStatusUtil.UNAUTHENTICATED}') {
        yield AuthenticationState.unauthenticated();
        _removeToken();
      }
    }
  }

  // Stream<AuthenticationState> _mapAuthenticatedToState(
  //     AuthenticationEventAuthenticated event) async* {
  //   yield AuthenticationState.authenticating();
  //   // await Future.delayed(Duration(milliseconds: 1000));
  //   if (event.authenticationModel != null) {
  //     _saveToken(event.authenticationModel.token);
  //     yield AuthenticationState.authenticated(
  //       authenticationModel: event.authenticationModel,
  //     );
  //   } else {
  //     yield AuthenticationState.unauthenticated();
  //   }
  // }

  // Stream<AuthenticationState> _mapLoadUserToState(
  //     AuthenticationEventLoadUser event, AuthenticationState state) async* {
  //   yield state.copyWith(
  //     isLoading: true,
  //   );
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   AuthenticationModel authenticationModel;
  //   try {
  //     authenticationModel = await authenticationRepository.fetchUser(
  //         token: state.authenticationModel.token);
  //   } catch (e) {
  //     print('Error at: AuthenticationBloc - _mapLoadUserToState: $e');
  //   }
  //   if (authenticationModel != null) {
  //     yield state.copyWith(
  //       authenticationModel: authenticationModel,
  //       isLoading: false,
  //     );
  //   } else {
  //     yield AuthenticationState.unauthenticated();
  //     _removeToken();
  //   }
  // }

  // Stream<AuthenticationState> _mapUpdateUserToState(
  //     AuthenticationEventUpdateUser event, AuthenticationState state) async* {
  //   yield state.copyWith(
  //     isLoading: true,
  //   );
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   AuthenticationModel authenticationModel;
  //   try {
  //     authenticationModel = await authenticationRepository.updateUser(
  //       token: state.authenticationModel.token,
  //       name: event.name ?? state.authenticationModel.user.name,
  //       phone: event.phone ?? state.authenticationModel.user.phone,
  //       imageSource: event.imageSource,
  //     );
  //   } catch (e) {
  //     print('Error at: AuthenticationBloc - _mapUpdateUserToState: $e');
  //   }
  //   if (authenticationModel != null) {
  //     yield state.copyWith(
  //       authenticationModel: authenticationModel,
  //       isLoading: false,
  //     );
  //   } else {
  //     yield AuthenticationState.unauthenticated();
  //     _removeToken();
  //   }
  // }

  _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(TOKEN_KEY, token);
  }

  _removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(TOKEN_KEY);
  }

  Future<String> _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(TOKEN_KEY);
  }

  // Future<AuthenticationModel> login({
  //   @required String username,
  //   @required String password,
  // }) =>
  //     authenticationRepository.checkLogin(
  //       username: username,
  //       password: password,
  //     );
}
