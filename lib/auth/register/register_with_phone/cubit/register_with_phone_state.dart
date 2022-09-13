part of 'register_with_phone_cubit.dart';

@immutable
abstract class RegisterWithPhoneState {
  final bool isSendOtpLoading;
  final bool isVerifyLoading;
  final bool isResendLoading;
  final bool isPhoneVerifyOtpLoading;

  const RegisterWithPhoneState({
    this.isSendOtpLoading = false,
    this.isVerifyLoading = false,
    this.isResendLoading = false,
    this.isPhoneVerifyOtpLoading=false,
  });
}

class RegisterWithPhoneInitial extends RegisterWithPhoneState {}

class RefreshUi extends RegisterWithPhoneState {}

class PhoneVerifyOtpLoading extends RegisterWithPhoneState {
  const PhoneVerifyOtpLoading()
      : super(isPhoneVerifyOtpLoading: true);
}

class PhoneVerifyOtpSuccess extends RegisterWithPhoneState {}

class PhoneVerifyCodeError extends RegisterWithPhoneState {
  final String errorMsg;

  const PhoneVerifyCodeError({required this.errorMsg})
      : super(isVerifyLoading: false);
}

class PhoneVerificationResendTimer extends RegisterWithPhoneState {}

class PhoneOtpSentSuccessfully extends RegisterWithPhoneState {}

class PhoneOtpReSentSuccessfully extends RegisterWithPhoneState {}

class PhoneVerificationSaveOtpCode extends RegisterWithPhoneState {}
class PhoneReSendOtpLoading extends RegisterWithPhoneState {
  const PhoneReSendOtpLoading()
      : super(isVerifyLoading: true);
}
class PhoneReSendOtpError extends RegisterWithPhoneState {
  final String errorMsg;

  const PhoneReSendOtpError({required this.errorMsg})
      : super(isVerifyLoading: false);
}
class PhonePinCodeNotFilled extends RegisterWithPhoneState {
  const PhonePinCodeNotFilled() : super(isVerifyLoading: false);
}
