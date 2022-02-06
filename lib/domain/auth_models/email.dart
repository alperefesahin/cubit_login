import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return null;
    }
    return _emailRegExp.hasMatch(value) && value.length < 30
        ? null
        : EmailValidationError.invalid;
  }
}

extension Explanation on EmailValidationError {
  String? get name {
    switch (this) {
      case EmailValidationError.invalid:
        return "This is not a valid email";
      default:
        return null;
    }
  }
}
