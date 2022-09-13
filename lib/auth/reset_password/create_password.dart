import 'package:authentication/auth/reset_password/cubit/create_password_cubit.dart';
import 'package:authentication/shared/components/customButton/CustomButton.dart';
import 'package:authentication/shared/components/custom_text_form_field.dart';
import 'package:authentication/shared/components/shimmer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createPasswordCubit =
    BlocProvider.of<CreatePasswordCubit>(context);
    return Scaffold(
      body: BlocBuilder<CreatePasswordCubit, CreatePasswordState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: createPasswordCubit.formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    'Create password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7466E3),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  CustomTextFormField(
                    roundedRectangleBorder: 10.0,
                    controller: createPasswordCubit.passwordController,
                    label: "Enter password",
                    textHint: "Your password",
                    prefix: const Icon(
                      Icons.lock,
                      color: Color(0xFF7466E3),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          createPasswordCubit.changePasswordVisibility(),
                      color: const Color(0xFF7466E3),
                      icon: Icon(
                        (createPasswordCubit.passwordIsVisibility)
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: createPasswordCubit.passwordIsVisibility,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter this field';
                      } else if (value.length < 8) {
                        return 'length of password less than 8';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomTextFormField(
                    roundedRectangleBorder: 10.0,
                    controller: createPasswordCubit.confirmPasswordController,
                    label: "confirm password",
                    textHint: "Re- write password",
                    prefix: const Icon(
                      Icons.lock,
                      color: Color(0xFF7466E3),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          createPasswordCubit.changeConfirmPasswordVisibility(),
                      color: const Color(0xFF7466E3),
                      icon: Icon(
                        (createPasswordCubit.confirmPasswordIsVisibility)
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: createPasswordCubit.confirmPasswordIsVisibility,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter this field';
                      } else if (value.length < 8) {
                        return 'length of password less than 8';
                      } else if (createPasswordCubit
                          .confirmPasswordController.text !=
                          createPasswordCubit.passwordController.text) {
                        return 'password and confirm password not the same';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20.0),
                  const SizedBox(height: 50.0),
                false  //state.isPhoneVerifyOtpLoading
                      ? const Padding(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: ShimmerButton(
                      width: double.infinity,
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: CustomButton(
                      height: 50.0,
                      textSize: 18.0,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      width: double.infinity,
                      title: 'Save',
                      onPress: () async {
                        if (createPasswordCubit.formKey.currentState!
                            .validate()) {
                         //todo go to home screen and save new pass
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
