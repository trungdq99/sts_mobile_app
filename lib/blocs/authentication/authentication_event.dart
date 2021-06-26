/*
 * Author: Trung Shin
 */

part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationEventChanged extends AuthenticationEvent {
  const AuthenticationEventChanged(this.authenticationModel);

  final AuthenticationModel authenticationModel;

  @override
  List<Object> get props => [authenticationModel];
}

class AuthenticationEventLoadPreviousLogin extends AuthenticationEvent {}

class AuthenticationEventLogout extends AuthenticationEvent {}

class AuthenticationEventUnknown extends AuthenticationEvent {}
