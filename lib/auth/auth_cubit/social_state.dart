part of 'social_cubit.dart';

@immutable
abstract class SocialState {}

class SocialInitial extends SocialState {}

 class RefreshUi extends SocialState {}
class SignInWithGoogleSuccess extends SocialState {}
class SignOutWithGoogleSuccess extends SocialState {}

//
// class PhoneOtpLoading extends SocialCubitState {}
//
// class PhoneOtpSuccess extends SocialCubitState {}
//
// class PhoneOtpError extends SocialCubitState {}
//
// class PhoneOtpTimeOut extends SocialCubitState {}
