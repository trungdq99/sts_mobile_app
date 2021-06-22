import 'package:formz/formz.dart';

enum UsernameValidationError { invalid }

class UsernameFormzInput extends FormzInput<String, UsernameValidationError> {
  const UsernameFormzInput.pure() : super.pure('');
  const UsernameFormzInput.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameValidationError validator(String value) {
    return value.isNotEmpty ? null : UsernameValidationError.invalid;
  }
}
