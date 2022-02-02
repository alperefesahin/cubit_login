import 'package:bloc_login/application/cubit/login/login_cubit.dart';
import 'package:bloc_login/presentation/forms/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: BlocProvider(
        create: (_) => LoginCubit(),
        child: const LoginForm(),
      ),
    );
  }
}
