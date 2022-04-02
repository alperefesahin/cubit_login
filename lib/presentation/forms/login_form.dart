import 'package:bloc_login/application/cubit/login/login_cubit.dart';
import 'package:bloc_login/presentation/widgets/sign_in_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
          listenWhen: (p, c) => p.status != c.status,
          listener: (context, state) {
            if (state.status.isSubmissionFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackBarWhenFailure(snackBarFailureText: state.exceptionError));
            } else if (state.status.isSubmissionSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(snackBarWhenSuccess());
            }
          },
          builder: (context, state) => Stack(
                children: [
                  Positioned.fill(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(38.0, 0, 38.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          loginText(),
                          emailInputField(context, state),
                          passwordInputField(context, state),
                          Row(
                            children: [
                              Expanded(child: signUpButton(context)),
                              Expanded(child: login(context, state)),
                              Expanded(child: forgotPassword(context, state))
                            ],
                          ),
                          Column(
                            children: [
                              seperatedText(),
                              signInWithGoogle(context, state),
                              signInWithGithub(context, state),
                              signInWithTwitter(context, state),
                              signInWithApple(context, state),
                              signInWithMicrosoft(context, state),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  state.status.isSubmissionInProgress
                      ? const Positioned(
                          child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container(),
                ],
              )),
    );
  }
}
