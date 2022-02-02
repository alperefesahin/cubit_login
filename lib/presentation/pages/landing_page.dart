import 'package:bloc_login/application/cubit/auth/auth_cubit.dart';
import 'package:bloc_login/presentation/pages/home_page.dart';
import 'package:bloc_login/presentation/pages/sign_in_page.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AuthState>(
      state: context.select((AuthCubit cubit) => cubit.state),
      onGeneratePages: (authState, pages) {
        if (authState.isSignedIn) {
          return [HomePage.page()];
        } else {
          return [SignInPage.page()];
        }
      },
    );
  }
}
