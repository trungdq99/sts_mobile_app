/*
 * Author: Trung Shin
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:sts/formz_input/password_formz_input.dart';
import 'package:sts/formz_input/username_formz_input.dart';
import 'package:sts/repository/authentication_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  // Handle Username Changed Event
  void usernameChanged(String value) {
    final username = UsernameFormzInput.dirty(value);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([username, state.password]),
    ));
  }

  // Handle Password Changed Event
  void passwordChanged(String value) {
    final password = PasswordFormzInput.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.username, password]),
    ));
  }

  // Handle Login Submitted
  Future<void> loginSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    await Future.delayed(Duration(milliseconds: 500));
    try {
      await _authenticationRepository.loginWithUsernameAndPassword(
        username: state.username.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        message: e.toString().split(': ')[1],
      ));
    }
  }
}
