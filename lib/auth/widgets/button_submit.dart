import 'package:authentication/auth/Screens/otp_screen.dart';
import 'package:authentication/auth/auth_cubit/social_cubit.dart';
import 'package:authentication/shared/components/customButton/CustomButton.dart';
import 'package:authentication/shared/components/customButton/button_cubit/button_cubit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonSubmit extends StatelessWidget {
  const ButtonSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<SocialCubit>(context);

    final buttonCubit = BlocProvider.of<ButtonCubit>(context);
    return BlocBuilder<ButtonCubit, ButtonCubitState>(
      builder: (context, state) {
        return CustomButton(
          height: 50.0,
          textSize: 18.0,
          textColor: Colors.white,
          fontWeight: FontWeight.w500,
          isLoading: buttonCubit.isLoading,
          isLoadingDone: buttonCubit.isLoadingDone,
          width: double.infinity,
          tittle: 'Submit',
          onPress: () async {
           // authCubit.verifyNumber();

            buttonCubit.changeLoadingStatus();
            Future.delayed(const Duration(milliseconds: 3000), () {
              buttonCubit.setButtonStatus();
            });

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const OtpScreen()),
            // );
          },
        );
      },
    );
  }
}
