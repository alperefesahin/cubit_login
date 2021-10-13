import 'package:bloc_login/application/auth/sign_up/sign_up_cubit.dart';
import 'package:bloc_login/domain/auth_models/auth_text_field.dart';
import 'package:bloc_login/domain/auth_models/email.dart';
import 'package:bloc_login/domain/auth_models/password.dart';
import 'package:bloc_login/domain/auth_models/name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

Widget SignUpText() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
    child: Text(
      'Register and Join Us!',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget NameInputField() {
  return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return AuthTextField(
          padding: const EdgeInsets.symmetric(vertical: 10),
          hint: 'Name Surname',
          keyboardType: TextInputType.name,
          error: state.name.error?.name,
          onChanged: (name) => context.read<SignUpCubit>().nameChanged(name),
        );
      });
}

Widget EmailInputField() {
  return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AuthTextField(
          padding: const EdgeInsets.symmetric(vertical: 10),
          hint: 'Email',
          keyboardType: TextInputType.emailAddress,
          error: state.email.error?.name,
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
        );
      });
}

Widget PasswordInputField() {
  return BlocBuilder<SignUpCubit, SignUpState>(
    buildWhen: (previous, current) => previous.password != current.password,
    builder: (context, state) {
      return AuthTextField(
        padding: const EdgeInsets.symmetric(vertical: 10),
        hint: 'Password',
        isPasswordField: true,
        keyboardType: TextInputType.text,
        error: state.password.error?.name,
        onChanged: (password) =>
            context.read<SignUpCubit>().passwordChanged(password),
      );
    },
  );
}

Widget SignUp() {
  return BlocBuilder<SignUpCubit, SignUpState>(
    buildWhen: (previous, current) => previous.status != current.status,
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text('Sign Up'),
          disabledColor: Colors.blueAccent.withOpacity(0.6),
          color: Colors.blueAccent,
          onPressed: state.status.isValidated
              ? () => context.read<SignUpCubit>().signUpWithCredentials()
              : null,
        ),
      );
    },
  );
}
