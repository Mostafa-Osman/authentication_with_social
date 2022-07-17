import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part   'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passwordIsVisibility = true;
  bool confirmPasswordIsVisibility = true;
  void changePasswordVisibility() {
    passwordIsVisibility = !passwordIsVisibility;
    emit(RefreshUi());
  }

  void changeConfirmPasswordVisibility() {
    confirmPasswordIsVisibility = !confirmPasswordIsVisibility;
    emit(RefreshUi());
  }

  Future<void> registerWithEmailAndPass() async {
    emit(const RegisterLoading());
    try {
      final loginResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      log(loginResult.user!.uid);
      emit(const RegisterSuccess());
    } catch (e, s) {
      emit( RegisterError(message: e.toString()));
      log('Error in Register :$e', stackTrace: s);
    }
  }
}
