import 'package:bloc_login/application/login/login_cubit.dart';
import 'package:bloc_login/presentation/widgets/home_page_widgets/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginCubit(),
        child: const HomePageBody(),
      ),
    );
  }
}
