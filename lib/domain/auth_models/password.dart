import 'package:formz/formz.dart';

enum PasswordValidationError { invalid, empty }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    return _passwordRegExp.hasMatch(value) && value.length < 10
        ? null
        : PasswordValidationError.invalid;
  }
}

extension Explanation on PasswordValidationError {
  String? get name {
    switch (this) {
      case PasswordValidationError.invalid:
        return "Invalid condition";
      default:
        return null;
    }
  }
}
