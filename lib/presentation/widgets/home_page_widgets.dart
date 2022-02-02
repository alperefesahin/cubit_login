import 'package:bloc_login/application/cubit/login/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget HomePageBody() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(100),
            child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Text('Logout'),
                disabledColor: Colors.blueAccent.withOpacity(0.6),
                color: Colors.blueAccent,
                onPressed: () => context.read<LoginCubit>().signOut()),
          );
        },
      )
    ],
  );
}
