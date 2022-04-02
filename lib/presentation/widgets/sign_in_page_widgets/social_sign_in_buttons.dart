import 'package:bloc_login/application/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SignInButton(Buttons.Google, onPressed: () => context.read<LoginCubit>().signInWithGoogle()));
  }
}

class SignInWithGithub extends StatelessWidget {
  const SignInWithGithub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SignInButton(Buttons.GitHub, onPressed: () => context.read<LoginCubit>().signInWithGithub()));
  }
}

class SignInWithTwitter extends StatelessWidget {
  const SignInWithTwitter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SignInButton(Buttons.Twitter, onPressed: () => context.read<LoginCubit>().signInWithTwitter()));
  }
}

class SignInWithApple extends StatelessWidget {
  const SignInWithApple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SignInButton(Buttons.Apple, onPressed: () => context.read<LoginCubit>().signInWithApple()));
  }
}

class SignInWithMicrosoft extends StatelessWidget {
  const SignInWithMicrosoft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SignInButton(Buttons.Microsoft, onPressed: () => context.read<LoginCubit>().signInWithMicrosoft()));
  }
}
