import 'package:authentication/auth/login/widgets/login_social.dart';
import 'package:authentication/auth/register/register_cubit/register_cubit.dart';
import 'package:authentication/auth/register/widgets/register_button.dart';
import 'package:authentication/auth/register/widgets/register_form.dart';
import 'package:authentication/home/screen/home.dart';
import 'package:authentication/shared/components/shimmer_button.dart';
import 'package:authentication/shared/constant/showToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            showToast(
                message: 'successfully login', state: ToastStates.success);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (state is RegisterError) {
            showToast(message: state.message, state: ToastStates.error);
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
                          'Register',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 120.0,
                        ),
                        const RegisterForm(),
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
                              : const RegisterButton(),
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
                              Navigator.pop(context);
                            },
                            child: const Text('Already have an account ?',
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
