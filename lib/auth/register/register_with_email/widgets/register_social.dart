import 'package:authentication/auth/login/login_cubit/login_cubit.dart';
import 'package:authentication/auth/register/register_with_email/register_cubit/register_cubit.dart';
import 'package:authentication/profile/screens/profile.dart';
import 'package:authentication/shared/constant/showToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegisterWithSocial extends StatelessWidget {
  const RegisterWithSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterWithEmailCubit>(context);
    return BlocConsumer<RegisterWithEmailCubit, RegisterWithEmailState>(
      listener: (context, state) {
        if (state is SignInWithGoogleSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        } else if (state is RegisterWithSocialError) {
          showToast(
              message: 'some thing wrong try again later',
              state: ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is RegisterWithSocialLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  registerCubit.registerWithGmail();
                },
                child: Container(
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/google.svg',
                      color: Colors.white,
                      width: 50,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                child: Container(
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(66, 103, 178, 1),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      'assets/icons/facebook.svg',
                      color: Colors.white,
                      width: 45,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                child: Container(
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Color(0xff32ccfe),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/icons/twitter.png',
                      color: Colors.white,
                      width: 45,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              // InkWell(
              //   child: Container(
              //     height: 50.0,
              //     decoration: const BoxDecoration(
              //       color: Colors.black,
              //       shape: BoxShape.circle,
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: SvgPicture.asset(
              //         'assets/icons/apple.svg',
              //         color: Colors.white,
              //         width: 45,
              //         fit: BoxFit.fitHeight,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        }
      },
    );
  }
}
