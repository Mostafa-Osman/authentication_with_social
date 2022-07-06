import 'package:authentication/auth/auth_cubit/social_cubit.dart';
import 'package:authentication/auth/widgets/button_submit.dart';
import 'package:authentication/shared/components/customButton/button_cubit/button_cubit_bloc.dart';
import 'package:authentication/shared/components/custom_text_form_field.dart';
import 'package:authentication/shared/constant/showToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonCubit = BlocProvider.of<ButtonCubit>(context);
    final authCubit = BlocProvider.of<SocialCubit>(context);

    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {
        // if (state is PhoneOtpSuccess) {
        //   buttonCubit.changeLoadingStatus();
        //   buttonCubit.setButtonStatus();
        //   showToast(message: 'successfully login', state: ToastStates.success);
        // } else if (state is PhoneOtpTimeOut) {
        //   buttonCubit.changeLoadingStatus();
        //
        //   showToast(message: 'time out', state: ToastStates.error);
        // } else if (state is PhoneOtpError) {
        //   buttonCubit.changeLoadingStatus();
        //
        //   showToast(message: 'Fail login', state: ToastStates.error);
        // }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Form(
              key: authCubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    roundedRectangleBorder: 10.0,
                    keyboardType: TextInputType.phone,
                    controller: authCubit.phoneController,
                    label: "Enter Phone",
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const ButtonSubmit(),

                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    'Or',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.indigo,
                        fontWeight: FontWeight.w600),
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
