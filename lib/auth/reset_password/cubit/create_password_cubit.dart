import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'create_password_state.dart';

class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit() : super(CreatePasswordInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
}
