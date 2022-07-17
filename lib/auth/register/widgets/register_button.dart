import 'package:authentication/auth/register/register_cubit/register_cubit.dart';
import 'package:authentication/shared/components/customButton/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<RegisterCubit>(context);
    return CustomButton(
      height: 50.0,
      textSize: 18.0,
      textColor: Colors.white,
      fontWeight: FontWeight.w500,
      width: double.infinity,
      tittle: 'Register',
      onPress: () async {
        if (registerCubit.formKey.currentState!.validate()) {
          await registerCubit.registerWithEmailAndPass();
        }
      },
    );
  }
}
