import 'package:bloc_login/application/sign_up/sign_up_cubit.dart';
import 'package:bloc_login/presentation/widgets/sign_up_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            var snackBar = SnackBar(content: Text(state.exceptionError), backgroundColor: Colors.red);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state.status.isSubmissionSuccess) {
            var snackBar = const SnackBar(
              content: Text("Success!"),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                        signUpText(),
                        nameInputField(context, state),
                        emailInputField(context, state),
                        passwordInputField(context, state),
                        rePasswordInputField(context, state),
                        signUp(context, state),
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
            ));
  }
}
