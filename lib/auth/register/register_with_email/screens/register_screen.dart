import 'package:authentication/auth/register/register_with_email/register_cubit/register_cubit.dart';
import 'package:authentication/auth/register/register_with_email/widgets/register_social.dart';
import 'package:authentication/auth/register/register_with_email/widgets/register_with_email_form.dart';
import 'package:authentication/auth/register/register_with_phone/wigdets/phone_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerWithEmailCubit =
        BlocProvider.of<RegisterWithEmailCubit>(context);

    return Scaffold(
      body: BlocBuilder<RegisterWithEmailCubit, RegisterWithEmailState>(
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
                      'Register',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Hello,',
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
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              height: 50.0,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFF7466E3),
                                    Color(0xFF5A50AA)
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        registerWithEmailCubit
                                            .selectRegisterType(
                                                registerWithPhone: false);
                                      },
                                      child: Text(
                                        'Email',
                                        style: TextStyle(
                                          color: registerWithEmailCubit
                                                  .isRegisterWithPhone
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        registerWithEmailCubit
                                            .selectRegisterType(
                                                registerWithPhone: true);
                                      },
                                      child: Text(
                                        'phone number',
                                        style: TextStyle(
                                            color: registerWithEmailCubit
                                                    .isRegisterWithPhone
                                                ? Colors.white
                                                : Colors.black87,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            (registerWithEmailCubit.isRegisterWithPhone)
                                ? const PhoneForm()
                                : const RegisterWithEmailForm()
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const RegisterWithSocial(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Already have an account ?',
                              style: TextStyle(fontSize: 20.0))),
                    ],
                  ),
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
