import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'register_with_phone_state.dart';

class RegisterWithPhoneCubit extends Cubit<RegisterWithPhoneState> {
  RegisterWithPhoneCubit() : super(RegisterWithPhoneInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  String? otpCode;
  int? resendToken;
  int seconds = 59;
  late String verificationId;
  Timer? timer;

  Future<void> sendOtp() async {
    emit(const PhoneVerifyOtpLoading());
    otpCode = '';

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2${phoneController.text}',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSentSuccessfully,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      timeout: const Duration(seconds: 120),
      forceResendingToken: resendToken,
    );
  }

  Future<void> verificationCompleted(PhoneAuthCredential credential) async {
    try {
      log('verificationCompleted');
      await signIn(credential);
    } catch (error) {
      log("error collected: $error");
    }
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    emit(const PhoneVerifyOtpLoading());

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneVerifyOtpSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-verification-code":
          emit(const PhoneVerifyCodeError(errorMsg: "Sorry, Code is wrong "));
          break;
        default:
          log(e.toString());
      }
    } catch (error) {
      emit(PhoneVerifyCodeError(errorMsg: error.toString()));
    }
  }

  void verificationFailed(FirebaseAuthException error) {
    log('verificationFailed : ${error.toString()}');
    emit(
      const PhoneVerifyCodeError(
        errorMsg:
            "We have blocked all requests from this device due to unusual activity. Try again later.",
      ),
    );
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    log('codeAutoRetrievalTimeout');
    emit(const PhoneVerifyCodeError(errorMsg: "time out"));
  }

  void codeSentSuccessfully(String verificationId, int? resendToken) {
    log('codeSent');
    try {
      this.verificationId = verificationId;
      this.resendToken = resendToken;
      seconds = 59;
      startTimer();
      emit(PhoneOtpSentSuccessfully());
    } catch (error) {
      log(error.toString());
    }
  }
  Future<void> resendVerifyCode() async {
    emit( const PhoneReSendOtpLoading());
    try {

      await sendOtp( );
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      emit(PhoneReSendOtpError(errorMsg: e.toString()));
    }
  }
  void codeReSentSuccessfully(String verificationId, int? resendToken) {
    log('codeReSent');
    try {
      this.verificationId = verificationId;
      this.resendToken = resendToken;
      seconds = 59;
      startTimer();
      emit(PhoneOtpReSentSuccessfully());
    } catch (error) {
      log(error.toString());
    }
  }
  Future<void> submitOTP() async {
    if (otpCode == null || otpCode!.length != 6) {
      emit(const PhonePinCodeNotFilled());
    } else {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode!,
      );
      log(otpCode!);
      await signIn(credential);
    }
  }
  void startTimer() {
    if (timer != null) timer!.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        emit(PhoneVerificationResendTimer());
      } else {
        timer.cancel();
      }
    });
  }
  void saveOtpCode(String? code) {
    otpCode = code;
    emit(PhoneVerificationSaveOtpCode());
  }

}
