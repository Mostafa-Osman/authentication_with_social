import 'package:authentication/auth/login/login_cubit/login_cubit.dart';
import 'package:authentication/shared/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Form(
              key: loginCubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    roundedRectangleBorder: 10.0,
                    controller: loginCubit.emailController,
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
                    controller: loginCubit.passwordController,
                    label: "Enter password",
                    textHint: "Your password",
                    prefix: const Icon(
                      Icons.lock,
                      color: Color(0xffAF4537),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => loginCubit.changePasswordVisibility(),
                      color: const Color(0xffAF4537),
                      icon: Icon(
                        (loginCubit.passwordIsVisibility)
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: loginCubit.passwordIsVisibility,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
