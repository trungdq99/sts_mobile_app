part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  authenticating,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final AuthenticationModel authenticationModel;
  final bool isLoading;

  const AuthenticationState({
    this.status: AuthenticationStatus.unknown,
    this.authenticationModel: const AuthenticationModel(),
    this.isLoading: false,
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

  factory AuthenticationState.authenticating() => AuthenticationState(
        status: AuthenticationStatus.authenticating,
      );

  AuthenticationState copyWith({
    AuthenticationStatus status,
    AuthenticationModel authenticationModel,
    bool isLoading,
  }) =>
      AuthenticationState(
        status: status ?? this.status,
        authenticationModel: authenticationModel ?? this.authenticationModel,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [
        status,
        authenticationModel,
        isLoading,
      ];
}
