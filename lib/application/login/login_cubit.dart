import 'package:bloc/bloc.dart';
import 'package:bloc_login/domain/auth_models/email.dart';
import 'package:bloc_login/domain/auth_models/password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

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

  void logInWithCredentials() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await _auth.signInWithEmailAndPassword(
          email: state.email.value, password: state.password.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      _auth.signInWithCredential(credential);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }

  Future<void> performLogin(
      {required String provider,
      required scopes,
      Map<String, String>? parameters}) async {
    await FirebaseAuthOAuth()
        .openSignInFlow(provider, scopes, parameters)
        .then((value) => value);
  }

  void signInWithGithub() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      await performLogin(
          provider: 'github.com',
          scopes: ['user:email'],
          parameters: {'lang': 'en'});
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }

  void signInWithTwitter() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await performLogin(
          provider: 'twitter.com',
          scopes: ['user:email'],
          parameters: {'lang': 'en'});
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }

  void signInWithApple() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      await performLogin(
          provider: 'apple.com',
          scopes: ['user:email'],
          parameters: {'lang': 'en'});

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }

  void signInWithMicrosoft() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await performLogin(
          provider: 'microsoft.com',
          scopes: ['user:email'],
          parameters: {'lang': 'en'});
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }

  void resetPassword() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await _auth.sendPasswordResetEmail(email: state.email.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }

  void signOut() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await _auth.signOut();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }
}
