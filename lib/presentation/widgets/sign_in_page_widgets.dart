import 'package:bloc_login/application/login/login_cubit.dart';
import 'package:bloc_login/domain/auth_models/auth_text_field.dart';
import 'package:bloc_login/domain/auth_models/email.dart';
import 'package:bloc_login/domain/auth_models/password.dart';
import 'package:bloc_login/presentation/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

Widget loginText() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
    child: Text(
      'Welcome to BlaBla App',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Padding seperatedText() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
    child: Text(
      'OR',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
    ),
  );
}

AuthTextField emailInputField(BuildContext context, LoginState state) {
  return AuthTextField(
    hint: 'Email',
    keyboardType: TextInputType.emailAddress,
    error: state.email.error?.name,
    onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
  );
}

AuthTextField passwordInputField(BuildContext context, LoginState state) {
  return AuthTextField(
    padding: const EdgeInsets.symmetric(vertical: 20),
    hint: 'Password',
    isPasswordField: true,
    keyboardType: TextInputType.text,
    error: state.password.error?.name,
    onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
  );
}

Padding login(BuildContext context, LoginState state) {
  return Padding(
      padding: const EdgeInsets.only(top: 15),
      child:
          SignInButton(Buttons.Email, mini: true, onPressed: () => context.read<LoginCubit>().logInWithCredentials()));
}

Padding signUpButton(context) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, right: 5),
    child: CupertinoButton(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(3),
      child: Container(
        margin: const EdgeInsets.all(3),
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      color: Colors.blueAccent,
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        )
      },
    ),
  );
}

Padding forgotPassword(BuildContext context, LoginState state) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, left: 5),
    child: CupertinoButton(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(3),
        child: Container(
          margin: const EdgeInsets.all(3),
          child: const Text(
            'Forgot Pw',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
        color: Colors.blueAccent,
        onPressed: () {
          context.read<LoginCubit>().resetPassword();
        }),
  );
}

Padding signInWithGoogle(BuildContext context, LoginState state) {
  return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SignInButton(Buttons.Google, onPressed: () => context.read<LoginCubit>().signInWithGoogle()));
}

Padding signInWithGithub(BuildContext context, LoginState state) {
  return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SignInButton(Buttons.GitHub, onPressed: () => context.read<LoginCubit>().signInWithGithub()));
}

Padding signInWithTwitter(BuildContext context, LoginState state) {
  return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SignInButton(Buttons.Twitter, onPressed: () => context.read<LoginCubit>().signInWithTwitter()));
}

Padding signInWithApple(BuildContext context, LoginState state) {
  return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SignInButton(Buttons.Apple, onPressed: () => context.read<LoginCubit>().signInWithApple()));
}

Widget signInWithMicrosoft(BuildContext context, LoginState state) {
  return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SignInButton(Buttons.Microsoft, onPressed: () => context.read<LoginCubit>().signInWithMicrosoft()));
}

SnackBar snackBarWhenSuccess() {
  return const SnackBar(
    content: Text("Success!"),
    backgroundColor: Colors.green,
  );
}

SnackBar snackBarWhenFailure({required String snackBarFailureText}) {
  return SnackBar(
    content: Text(snackBarFailureText),
    backgroundColor: Colors.red,
  );
}
