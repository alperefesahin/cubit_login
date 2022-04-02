part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial({@Default(false) bool isSignedIn}) = _Initial;
}
