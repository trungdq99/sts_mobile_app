/*
 * Author: Trung Shin
 */

import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class PasswordFormzInput extends FormzInput<String, PasswordValidationError> {
  const PasswordFormzInput.pure() : super.pure('');
  const PasswordFormzInput.dirty([String value = '']) : super.dirty(value);

  // static final _passwordRegExp =
  //     RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');

  @override
  PasswordValidationError validator(String value) {
    return value.isNotEmpty ? null : PasswordValidationError.invalid;
  }
}
