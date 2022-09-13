import 'dart:developer';
import 'package:authentication/auth/register/register_with_phone/cubit/register_with_phone_cubit.dart';
import 'package:authentication/shared/components/customButton/CustomButton.dart';
import 'package:authentication/shared/components/shimmer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneCubit = BlocProvider.of<RegisterWithPhoneCubit>(context);
    return Scaffold(
      body: BlocBuilder<RegisterWithPhoneCubit, RegisterWithPhoneState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    phoneCubit.phoneController.text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/edit_pen.svg',
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF7466E3),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PinCodeTextField(
                  length: 6,
                  autoFocus: true,
                  cursorColor: const Color(0xFF7466E3),
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(6),
                    borderWidth: 1,
                    fieldHeight: 40,
                    fieldWidth: 40,
                    activeFillColor: const Color(0xFF7466E3),
                    inactiveColor: Colors.grey.shade500,
                    inactiveFillColor: const Color(0xFFFAFAFA),
                    selectedColor: const Color(0xFF7466E3),
                    selectedFillColor: const Color(0xFFFAFAFA),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) => phoneCubit.saveOtpCode(v),
                  onChanged: (value) => log(value),
                  beforeTextPaste: (text) {
                    log("Allowing to paste $text");
                    return true;
                  },
                  appContext: context,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I didn't Receive a code",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (phoneCubit.seconds != 0 && !state.isResendLoading)
                        SizedBox(
                          width: 30,
                          child: Text(
                            "0:${phoneCubit.seconds < 10 ? '0' : ''}${phoneCubit.seconds}",
                            style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (phoneCubit.seconds == 0) {
                            phoneCubit.resendVerifyCode();
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state.isResendLoading)
                              const SizedBox(
                                height: 14,
                                width: 14,
                                child: CircularProgressIndicator(
                                  color: Color(0xFF7466E3),
                                  strokeWidth: 5,
                                ),
                              )
                            else
                              SvgPicture.asset(
                                'assets/icons/rotate_left.svg',
                                height: 18,
                                width: 18,
                                color: phoneCubit.seconds == 0
                                    ? const Color(0xFF7466E3)
                                    : Colors.grey,
                              ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Resend",
                              style: TextStyle(
                                color: phoneCubit.seconds == 0
                                    ? const Color(0xFF7466E3)
                                    : Colors.grey.shade400,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              if (state.isPhoneVerifyOtpLoading)
                const Center(child: ShimmerButton(width: 270, height: 45))
              else
                Center(
                  child: CustomButton(
                    onPress: () => phoneCubit.submitOTP(),
                    title: 'submit code',
                    width: 270,
                    height: 45,
                    textSize: 16,
                    textColor: Colors.white,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
