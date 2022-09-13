import 'package:authentication/auth/register/register_with_phone/cubit/register_with_phone_cubit.dart';
import 'package:authentication/auth/reset_password/create_password.dart';
import 'package:authentication/auth/widgets/verification_screen.dart';
import 'package:authentication/home/screen/home.dart';
import 'package:authentication/shared/components/customButton/CustomButton.dart';
import 'package:authentication/shared/components/custom_text_form_field.dart';
import 'package:authentication/shared/components/shimmer_button.dart';
import 'package:authentication/shared/constant/showToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneForm extends StatelessWidget {
  const PhoneForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerWithPhoneCubit =
        BlocProvider.of<RegisterWithPhoneCubit>(context);
    return BlocConsumer<RegisterWithPhoneCubit, RegisterWithPhoneState>(
      listener: (context, state) {
        if (state is PhoneOtpSentSuccessfully) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VerificationScreen(),
            ),
          );
        } else if (state is PhoneVerifyOtpSuccess) {
          // showToast(message: 'Successfully register', state: ToastStates.error);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePasswordScreen(),
            ),
          );
        } else if (state is PhoneVerifyCodeError) {
          showToast(message: state.errorMsg, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Form(
              key: registerWithPhoneCubit.formKey,
              child: CustomTextFormField(
                roundedRectangleBorder: 10.0,
                controller: registerWithPhoneCubit.phoneController,
                keyboardType: TextInputType.phone,
                label: "Your Phone",
                prefix: const Icon(
                  Icons.phone_android,
                  color: Color(0xFF7466E3),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter this field';
                  } else if (value.length < 11) {
                    return 'Invalid phone';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 50.0),
            state.isPhoneVerifyOtpLoading
                ? const Padding(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: ShimmerButton(
                      width: double.infinity,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: CustomButton(
                      height: 50.0,
                      textSize: 18.0,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      width: double.infinity,
                      title: 'verify phone',
                      onPress: () async {
                        if (registerWithPhoneCubit.formKey.currentState!
                            .validate()) {
                          registerWithPhoneCubit.sendOtp();
                        }
                      },
                    ),
                  ),
          ],
        );
      },
    );
  }
}
