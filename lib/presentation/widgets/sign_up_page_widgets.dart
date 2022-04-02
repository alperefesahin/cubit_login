import 'package:bloc_login/application/cubit/sign_up/sign_up_cubit.dart';
import 'package:bloc_login/domain/auth_models/auth_text_field.dart';
import 'package:bloc_login/domain/auth_models/email.dart';
import 'package:bloc_login/domain/auth_models/password.dart';
import 'package:bloc_login/domain/auth_models/re_password.dart';
import 'package:bloc_login/domain/auth_models/name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Padding signUpText() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
    child: Text(
      'Register and Join Us!',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

AuthTextField nameInputField(BuildContext context, SignUpState state) {
  return AuthTextField(
    padding: const EdgeInsets.symmetric(vertical: 10),
    hint: 'Name Surname',
    keyboardType: TextInputType.name,
    error: state.name.error?.name,
    onChanged: (name) => context.read<SignUpCubit>().nameChanged(name),
  );
}

AuthTextField emailInputField(BuildContext context, SignUpState state) {
  return AuthTextField(
    padding: const EdgeInsets.symmetric(vertical: 10),
    hint: 'Email',
    keyboardType: TextInputType.emailAddress,
    error: state.email.error?.name,
    onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
  );
}

AuthTextField passwordInputField(BuildContext context, SignUpState state) {
  return AuthTextField(
    padding: const EdgeInsets.symmetric(vertical: 10),
    hint: 'Password',
    isPasswordField: true,
    keyboardType: TextInputType.text,
    error: state.password.error?.name,
    onChanged: (password) => context.read<SignUpCubit>().passwordChanged(password),
  );
}

AuthTextField rePasswordInputField(BuildContext context, SignUpState state) {
  return AuthTextField(
    padding: const EdgeInsets.symmetric(vertical: 10),
    hint: 'Re-Password',
    isPasswordField: true,
    keyboardType: TextInputType.text,
    error: state.rePassword.error?.name,
    onChanged: (rePassword) => context.read<SignUpCubit>().rePasswordChanged(rePassword),
  );
}

Padding signUp(BuildContext context, SignUpState state) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Text('Sign Up'),
      disabledColor: Colors.blueAccent.withOpacity(0.6),
      color: Colors.blueAccent,
      onPressed: state.displaySignUpButton ? () => context.read<SignUpCubit>().signUpWithCredentials() : null,
    ),
  );
}
