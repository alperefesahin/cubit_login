import 'package:bloc_login/application/login/login_cubit.dart';
import 'package:bloc_login/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/domain/auth_models/email.dart';
import 'package:bloc_login/domain/auth_models/password.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({Key? key, required this.state}) : super(key: key);
  final LoginState state;
  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      hint: 'Email',
      keyboardType: TextInputType.emailAddress,
      error: state.email.error?.name,
      onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
    );
  }
}

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({Key? key, required this.state}) : super(key: key);
  final LoginState state;
  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      padding: const EdgeInsets.symmetric(vertical: 20),
      hint: 'Password',
      isPasswordField: true,
      keyboardType: TextInputType.text,
      error: state.password.error?.name,
      onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
    );
  }
}
