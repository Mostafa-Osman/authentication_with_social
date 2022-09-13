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
                  Container(
                    height: 50.0,
                    decoration: const BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF7466E3), Color(0xFF5A50AA)],
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              loginCubit.selectLoginType(loginWithPhone: false);
                            },
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: loginCubit.isLoginWithPhone
                                    ?Colors.black
                                    :Colors.white ,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              loginCubit.selectLoginType(loginWithPhone: true);
                            },
                            child: Text(
                              'phone number',
                              style: TextStyle(
                                  color: loginCubit.isLoginWithPhone
                                      ?Colors.white
                                      :Colors.black87 ,
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
                  CustomTextFormField(
                    roundedRectangleBorder: 10.0,
                    controller: loginCubit.emailController,
                    keyboardType: loginCubit.isLoginWithPhone
                        ? TextInputType.phone
                        : TextInputType.emailAddress,
                    label: loginCubit.isLoginWithPhone
                        ? "Your phone"
                        : "Your email",
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
                  if(!loginCubit.isLoginWithPhone)
                  CustomTextFormField(
                    roundedRectangleBorder: 10.0,
                    controller: loginCubit.passwordController,
                    label: "Enter password",
                    textHint: "Your password",
                    prefix: const Icon(
                      Icons.lock,
                      color: Color(0xFF7466E3),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => loginCubit.changePasswordVisibility(),
                      color: const Color(0xFF7466E3),

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
