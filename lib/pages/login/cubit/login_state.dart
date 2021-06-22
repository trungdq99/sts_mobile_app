part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username: const UsernameFormzInput.pure(),
    this.password: const PasswordFormzInput.pure(),
    this.status: FormzStatus.pure,
    this.message: '',
  });

  final UsernameFormzInput username;
  final PasswordFormzInput password;
  final FormzStatus status;
  final String message;

  @override
  List<Object> get props => [
        username,
        password,
        status,
        message,
      ];

  LoginState copyWith({
    UsernameFormzInput username,
    PasswordFormzInput password,
    FormzStatus status,
    String message,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
