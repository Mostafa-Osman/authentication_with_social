import 'package:authentication/auth/login/login_cubit/login_cubit.dart';
import 'package:authentication/auth/login/widgets/button_submit.dart';
import 'package:authentication/auth/login/widgets/login_social.dart';
import 'package:authentication/auth/register/screens/register_screen.dart';
import 'package:authentication/home/screen/home.dart';
import 'package:authentication/profile/screens/profile.dart';
import 'package:authentication/shared/components/shimmer_button.dart';
import 'package:authentication/shared/constant/showToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            showToast(
                message: 'successfully login', state: ToastStates.success);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (state is LoginError) {
            showToast(message: 'Fail login', state: ToastStates.error);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0).copyWith(top: 100.0),
                child: Center(
                  child: SizedBox(
                    child: Column(
                      children: [
                        const Text(
                          'Sign in',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 120.0,
                        ),
                        const LoginForm(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: state.isLoading
                              ? const ShimmerButton(
                                  width: double.infinity,
                                )
                              : const ButtonSubmit(),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        const Text(
                          'Or',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.indigo,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 30.0),
                        const LoginWithSocial(),
                        const SizedBox(height: 30.0),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: const Text('Don\'t have an account ?',
                                style: TextStyle(fontSize: 20.0)))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
