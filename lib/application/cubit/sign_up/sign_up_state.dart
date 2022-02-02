part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial(
      {@Default(Email.pure()) Email email,
      @Default(Password.pure()) Password password,
      @Default(FormzStatus.pure) FormzStatus status,
      @Default(Name.pure()) Name name,
      @Default('') String exceptionError}) = _Initial;
}
