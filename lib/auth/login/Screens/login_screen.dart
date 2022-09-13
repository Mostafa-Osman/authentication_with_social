import 'package:authentication/auth/login/login_cubit/login_cubit.dart';
import 'package:authentication/auth/login/widgets/button_submit.dart';
import 'package:authentication/auth/login/widgets/login_social.dart';
import 'package:authentication/auth/register/register_with_email/screens/register_screen.dart';
import 'package:authentication/home/screen/home.dart';
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
            showToast(
                message: 'Email or password invalid', state: ToastStates.error);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF7466E3), Color(0xFF5A50AA)],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      left: 15.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 250,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          padding:
                              const EdgeInsets.all(20.0).copyWith(top: 50.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),
                          ),
                          child: Column(
                            children: [
                              const LoginForm(),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, left: 10.0),
                                child: state.isLoading
                                    ? const ShimmerButton(
                                        width: double.infinity,
                                      )
                                    : const ButtonSubmit(),
                              ),
                              const SizedBox(height: 60.0),
                              const LoginWithSocial(),
                              const SizedBox(height: 50.0),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen()));
                                },
                                child: const Text(
                                  'Don\'t have an account ?',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                )),
          );
        },
      ),
    );
  }
}
