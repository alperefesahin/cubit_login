part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const SignUpState._();

  const factory SignUpState.initial(
      {@Default(Email.pure()) Email email,
      @Default(Password.pure()) Password password,
      @Default(RePassword.pure()) RePassword rePassword,
      @Default(FormzStatus.pure) FormzStatus status,
      @Default(Name.pure()) Name name,
      @Default('') String exceptionError}) = _Initial;

  bool get isPasswordsMatch => password.value == rePassword.value;
  bool get displaySignUpButton => status.isValidated && isPasswordsMatch;
}
