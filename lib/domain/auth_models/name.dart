import 'package:formz/formz.dart';

enum NameError { empty, invalid }

class Name extends FormzInput<String, NameError> {
  const Name.pure([String value = '']) : super.pure(value);
  const Name.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  @override
  NameError? validator(String value) {
    if (value.isEmpty == true || value == "") {
      return NameError.empty;
    }
    return _nameRegExp.hasMatch(value) && value.length < 10
        ? null
        : value.isEmpty
            ? null
            : NameError.invalid;
  }
}

extension Explanation on NameError {
  String? get name {
    switch (this) {
      case NameError.invalid:
        return "This is not a valid name";
      default:
        return null;
    }
  }
}
