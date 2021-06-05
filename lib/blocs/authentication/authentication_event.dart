part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// class AuthenticationEventLoadUser extends AuthenticationEvent {
//   const AuthenticationEventLoadUser();
// }

class AuthenticationEventUserChanged extends AuthenticationEvent {
  const AuthenticationEventUserChanged(this.authenticationModel);

  final AuthenticationModel authenticationModel;

  @override
  List<Object> get props => [authenticationModel];
}

class AuthenticationEventLoadPreviousLogin extends AuthenticationEvent {}

class AuthenticationEventLogout extends AuthenticationEvent {}
