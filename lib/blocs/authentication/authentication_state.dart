part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final AuthenticationModel authenticationModel;

  const AuthenticationState({
    this.status: AuthenticationStatus.unknown,
    this.authenticationModel: AuthenticationModel.empty,
  });

  factory AuthenticationState.authenticated(
          {@required AuthenticationModel authenticationModel}) =>
      AuthenticationState(
        status: AuthenticationStatus.authenticated,
        authenticationModel: authenticationModel,
      );

  factory AuthenticationState.unauthenticated() => AuthenticationState(
        status: AuthenticationStatus.unauthenticated,
      );

  AuthenticationState copyWith({
    AuthenticationStatus status,
    AuthenticationModel authenticationModel,
  }) =>
      AuthenticationState(
        status: status ?? this.status,
        authenticationModel: authenticationModel ?? this.authenticationModel,
      );

  @override
  List<Object> get props => [
        status,
        authenticationModel,
      ];
}
