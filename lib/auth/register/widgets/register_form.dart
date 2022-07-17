import 'package:authentication/auth/login/login_cubit/login_cubit.dart';
import 'package:authentication/auth/register/register_cubit/register_cubit.dart';
import 'package:authentication/shared/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Form(
              key: registerCubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    roundedRectangleBorder: 10.0,
                    controller: registerCubit.emailController,
                    label: "Your email",
                    prefix: const Icon(
                      Icons.account_circle,
                      color: Color(0xffAF4537),
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
                    controller: registerCubit.passwordController,
                    label: "Enter password",
                    textHint: "Your password",
                    prefix: const Icon(
                      Icons.lock,
                      color: Color(0xffAF4537),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => registerCubit.changePasswordVisibility(),
                      color: const Color(0xffAF4537),
                      icon: Icon(
                        (registerCubit.passwordIsVisibility)
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: registerCubit.passwordIsVisibility,
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
                    controller: registerCubit.confirmPasswordController,
                    label: "confirm password",
                    textHint: "Re- write password",
                    prefix: const Icon(
                      Icons.lock,
                      color: Color(0xffAF4537),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => registerCubit.changeConfirmPasswordVisibility(),
                      color: const Color(0xffAF4537),
                      icon: Icon(
                        (registerCubit.confirmPasswordIsVisibility)
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: registerCubit.confirmPasswordIsVisibility,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter this field';
                      } else if (value.length < 8) {
                        return 'length of password less than 8';
                      } else if (registerCubit.confirmPasswordController.text !=
                          registerCubit.passwordController.text) {
                        return 'password and confirm password not the same';
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
