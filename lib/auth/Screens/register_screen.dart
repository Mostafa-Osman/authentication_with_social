import 'package:authentication/auth/widgets/login_social.dart';
import 'package:flutter/material.dart';

import '../widgets/register_form.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0).copyWith(top: 100.0),
            child: Center(
              child: SizedBox(
                child: Column(
                  children: const [
                    Text(
                      'Sign up',
                      style:
                          TextStyle(color: Colors.indigo, fontSize: 40.0,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 120.0,),
                    RegisterForm(),
                    SizedBox(height: 70.0),
                    RegisterWithSocial(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
