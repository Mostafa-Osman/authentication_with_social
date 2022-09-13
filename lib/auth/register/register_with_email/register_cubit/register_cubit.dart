import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'register_state.dart';

class RegisterWithEmailCubit extends Cubit<RegisterWithEmailState> {
  RegisterWithEmailCubit() : super(RegisterInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passwordIsVisibility = true;
  bool confirmPasswordIsVisibility = true;
  final register = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  bool isRegisterWithPhone = false;


  GoogleSignInAccount? googleAccount;

  void changePasswordVisibility() {
    passwordIsVisibility = !passwordIsVisibility;
    emit(RefreshUi());
  }

  void changeConfirmPasswordVisibility() {
    confirmPasswordIsVisibility = !confirmPasswordIsVisibility;
    emit(RefreshUi());
  }

  Future<void> registerWithEmailAndPass() async {
    emit(const RegisterWithEmailLoading());
    try {
      final registerResult = await register.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      log(registerResult.user!.uid);
      emit(const RegisterWithEmailSuccess());
    } catch (e, s) {
      emit(RegisterWithEmailError(message: e.toString()));
      log('Error in Register :$e', stackTrace: s);
    }
  }



  Future<void> registerWithGmail() async {
    emit(const RegisterWithSocialLoading());
    googleAccount = await _googleSignIn.signIn();
    if (googleAccount != null) {
      try {
        final registerResult = await register.createUserWithEmailAndPassword(
            email: googleAccount!.email, password: googleAccount!.id);
        log(registerResult.user!.uid);
        emit(const RegisterWithSocialSuccess());
      } catch (e, s) {
        emit(RegisterWithSocialError(message: e.toString()));
        log('Error in Register :$e', stackTrace: s);
      }
    } else {
      emit(const RegisterWithSocialError(message: 'no account found'));
    }
  }
  void selectRegisterType({required bool registerWithPhone}) {
    isRegisterWithPhone = registerWithPhone;
    emit(RefreshUi());
  }

}
