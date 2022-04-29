part of 'social_cubit.dart';

@immutable
abstract class AuthCubitState {}

class AuthCubitInitial extends AuthCubitState {}

class RefreshUi extends AuthCubitState {}

class PhoneOtpLoading extends AuthCubitState {}

class PhoneOtpSuccess extends AuthCubitState {}

class PhoneOtpError extends AuthCubitState {}

class PhoneOtpTimeOut extends AuthCubitState {}
