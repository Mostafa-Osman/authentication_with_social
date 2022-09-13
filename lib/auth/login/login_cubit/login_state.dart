part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  final bool isLoading;

  const LoginState({this.isLoading = false});
}

class LoginInitial extends LoginState {}

class RefreshUi extends LoginState {}

class LoginLoading extends LoginState {
  const LoginLoading() : super(isLoading: true);
}

class LoginSuccess extends LoginState {
  const LoginSuccess() : super(isLoading: false);
}

class LoginError extends LoginState {
  const LoginError() : super(isLoading: false);
}

class SignInWithGoogleLoading extends LoginState {}

class SignInWithGoogleSuccess extends LoginState {}

class SignOutWithGoogleSuccess extends LoginState {}

class SignInWithGoogleError extends LoginState {}

// class PhoneOtpLoading extends SocialCubitState {}
//
// class PhoneOtpSuccess extends SocialCubitState {}
//
// class PhoneOtpError extends SocialCubitState {}
//
// class PhoneOtpTimeOut extends SocialCubitState {}
