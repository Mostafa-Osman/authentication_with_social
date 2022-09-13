import 'package:authentication/auth/register/register_with_email/register_cubit/register_cubit.dart';
import 'package:authentication/auth/register/register_with_phone/cubit/register_with_phone_cubit.dart';
import 'package:authentication/home/screen/home.dart';
import 'package:authentication/shared/components/customButton/CustomButton.dart';
import 'package:authentication/shared/components/custom_text_form_field.dart';
import 'package:authentication/shared/components/shimmer_button.dart';
import 'package:authentication/shared/constant/showToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterWithEmailForm extends StatelessWidget {
  const RegisterWithEmailForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerWithEmailCubit = BlocProvider.of<RegisterWithEmailCubit>(
        context);

    return BlocConsumer<RegisterWithEmailCubit, RegisterWithEmailState>(
      listener: (context, state) {
        if (state is RegisterWithSocialSuccess ||
            state is RegisterWithEmailSuccess) {
          showToast(
              message: 'successfully Register', state: ToastStates.success);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else if (state is RegisterWithSocialError) {
          showToast(message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: registerWithEmailCubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                roundedRectangleBorder: 10.0,
                controller: registerWithEmailCubit.emailController,
                keyboardType: registerWithEmailCubit.isRegisterWithPhone
                    ? TextInputType.phone
                    : TextInputType.emailAddress,
                label: "Your email",
                prefix: const Icon(
                  Icons.account_circle,
                  color: Color(0xFF7466E3),

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter this field';
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                    return 'Invalid email';
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
                  controller: registerWithEmailCubit.passwordController,
                  label: "Enter password",
                  textHint: "Your password",
                  prefix: const Icon(
                    Icons.lock,
                    color: Color(0xFF7466E3),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        registerWithEmailCubit.changePasswordVisibility(),
                    color: const Color(0xFF7466E3),
                    icon: Icon(
                      (registerWithEmailCubit.passwordIsVisibility)
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  obscureText: registerWithEmailCubit.passwordIsVisibility,
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
                  controller: registerWithEmailCubit.confirmPasswordController,
                  label: "confirm password",
                  textHint: "Re- write password",
                  prefix: const Icon(
                    Icons.lock,
                    color: Color(0xFF7466E3),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        registerWithEmailCubit
                            .changeConfirmPasswordVisibility(),
                    color: const Color(0xFF7466E3),
                    icon: Icon(
                      (registerWithEmailCubit.confirmPasswordIsVisibility)
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  obscureText:
                  registerWithEmailCubit.confirmPasswordIsVisibility,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter this field';
                    } else if (value.length < 8) {
                      return 'length of password less than 8';
                    } else if (registerWithEmailCubit
                        .confirmPasswordController.text !=
                        registerWithEmailCubit.passwordController.text) {
                      return 'password and confirm password not the same';
                    } else {
                      return null;
                    }
                  },
                ),
              const SizedBox(height: 20.0),
              state.isLoading
                  ? const Padding(
                padding:
                EdgeInsets.only(right: 10.0, left: 10.0),
                child: ShimmerButton(
                  width: double.infinity,
                ),
              )
                  : Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, left: 10.0),
                child: CustomButton(
                  height: 50.0,
                  textSize: 18.0,
                  textColor: Colors.white,
                  fontWeight: FontWeight.w500,
                  width: double.infinity,
                  title:  'Register',
                  onPress: () async {

                      if (registerWithEmailCubit
                          .formKey.currentState!
                          .validate()) {
                        await registerWithEmailCubit
                            .registerWithEmailAndPass();
                      }

                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
