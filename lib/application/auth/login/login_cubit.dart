import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:bloc_login/domain/auth_models/email.dart';
import 'package:bloc_login/domain/auth_models/password.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> performLogin(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      await FirebaseAuthOAuth().openSignInFlow(provider, scopes, parameters);
    } on PlatformException catch (error) {
      emit(state.copyWith(exceptionError: error.toString()));
    }
  }

  Future<void> logInWithCredentials() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _auth.signInWithEmailAndPassword(
          email: state.email.value, password: state.password.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future signInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      });
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future signInWithGithub() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await performLogin("github.com", ["user:email"], {"lang": "en"});
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future signInWithTwitter() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await performLogin("twitter.com", ["user:email"], {"lang": "en"});
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future signInWithApple() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await performLogin("apple.com", ["user:email"], {"lang": "en"});
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future signInWithMicrosoft() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await performLogin("microsoft.com", ["user:email"], {"lang": "en"});
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future<void> resetPassword() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: state.email.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      return await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }
}
