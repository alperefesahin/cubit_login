import 'package:bloc_login/application/sign_up/sign_up_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key, required this.state}) : super(key: key);
  final SignUpState state;
  @override
  Widget build(BuildContext context) {
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
}
