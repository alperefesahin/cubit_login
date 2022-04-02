import 'package:bloc_login/application/login/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
