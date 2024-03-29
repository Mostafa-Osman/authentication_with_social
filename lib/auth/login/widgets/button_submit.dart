import 'package:authentication/auth/login/login_cubit/login_cubit.dart';
import 'package:authentication/shared/components/customButton/CustomButton.dart';
import 'package:authentication/shared/components/customButton/button_cubit/button_cubit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return CustomButton(
      height: 50.0,
      textSize: 18.0,
      textColor: Colors.white,
      fontWeight: FontWeight.w500,
      width: double.infinity,
      title: 'Submit',
      onPress: () async {
        // authCubit.verifyNumber();
        if (loginCubit.isLoginWithPhone) {
          loginCubit.loginWithPhoneNumber();
        } else {
          if (loginCubit.formKey.currentState!.validate()) {
            await loginCubit.loginWithEmailAndPass();
          }
        }

        //
        // buttonCubit.changeLoadingStatus();
        // Future.delayed(const Duration(milliseconds: 3000), () {
        //   buttonCubit.setButtonStatus();
        // });

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const OtpScreen()),
        // );
      },
    );

  }
}
