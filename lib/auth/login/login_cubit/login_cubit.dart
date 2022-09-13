import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordIsVisibility = true;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoginWithPhone = false;

  Future<void> loginWithEmailAndPass() async {
    emit(const LoginLoading());
    try {
      final loginResult = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      log(loginResult.user!.uid);
      emit(const LoginSuccess());
    } catch (e, s) {
      emit(const LoginError());
      log('Error in login :$e', stackTrace: s);
    }
  }
  Future<void> loginWithPhoneNumber() async {
    emit(const LoginLoading());
    try {
      final loginResult = await auth.signInWithPhoneNumber(emailController.text);
      emit(const LoginSuccess());
    } catch (e, s) {
      emit(const LoginError());
      log('Error in login :$e', stackTrace: s);
    }
  }

  void changePasswordVisibility() {
    passwordIsVisibility = !passwordIsVisibility;
    emit(RefreshUi());
  }

  // final otpController = TextEditingController();
  //
  // //otp
  // void verifyNumber() {
  //   emit(PhoneOtpLoading());
  //   auth.verifyPhoneNumber(
  //       phoneNumber: phoneController.text,
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await auth.signInWithCredential(credential).then((value) {
  //           log('successfully login');
  //           emit(PhoneOtpSuccess());
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException exception) {
  //         log('Fail login');
  //         emit(PhoneOtpError());
  //       },
  //       codeSent: (String verificationID, int? reSendToken) {},
  //       codeAutoRetrievalTimeout: (String verificationID) {
  //         emit(PhoneOtpTimeOut());
  //       });
  // }

  // social

  // login with google account
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  Future<void> loginWithGoogle() async {
    emit(SignInWithGoogleLoading());
    try {
      googleAccount = await _googleSignIn.signIn();
      emit(SignInWithGoogleSuccess());
    } catch (e, s) {
      emit(SignInWithGoogleError());
      log('Error in login :$e', stackTrace: s);
    }
  }

  loggOut() async {
    googleAccount = await _googleSignIn.signOut();
    emit(SignOutWithGoogleSuccess());
  }

  void selectLoginType({required bool loginWithPhone}) {
    isLoginWithPhone = loginWithPhone;
    emit(RefreshUi());
  }
}
