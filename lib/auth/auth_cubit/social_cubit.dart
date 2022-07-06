import 'dart:developer';

import 'package:authentication/home/screen/home.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  // final otpController = TextEditingController();
  // final FirebaseAuth auth = FirebaseAuth.instance;
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
  loginWithGoogle( ) async {
    googleAccount = await _googleSignIn.signIn();
    emit(SignInWithGoogleSuccess());
  }

  loggOut() async {
    googleAccount = await _googleSignIn.signOut();
    emit(SignOutWithGoogleSuccess());
  }
}
