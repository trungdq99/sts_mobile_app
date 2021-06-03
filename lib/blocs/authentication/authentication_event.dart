part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationEventLoadUser extends AuthenticationEvent {
  const AuthenticationEventLoadUser();
}

class AuthenticationEventAuthenticated extends AuthenticationEvent {
  final AuthenticationModel authenticationModel;
  const AuthenticationEventAuthenticated({
    @required this.authenticationModel,
  });

  @override
  List<Object> get props => [
        authenticationModel,
      ];
}

class AuthenticationEventLoadPreviousLogin extends AuthenticationEvent {}

class AuthenticationEventLogout extends AuthenticationEvent {}

class AuthenticationEventUnknown extends AuthenticationEvent {}