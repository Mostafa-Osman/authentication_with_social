part of 'register_cubit.dart';

@immutable
abstract class RegisterWithEmailState {
  final bool isLoading;

  const RegisterWithEmailState({this.isLoading = false});
}

class RegisterInitial extends RegisterWithEmailState {}

class RefreshUi extends RegisterWithEmailState {}

class RegisterWithEmailLoading extends RegisterWithEmailState {
  const RegisterWithEmailLoading() : super(isLoading: true);
}

class RegisterWithEmailSuccess extends RegisterWithEmailState {
  const RegisterWithEmailSuccess() : super(isLoading: false);
}

class RegisterWithEmailError extends RegisterWithEmailState {
  final String message;

  const RegisterWithEmailError({required this.message})
      : super(isLoading: false);
}

class RegisterWithSocialLoading extends RegisterWithEmailState {
  const RegisterWithSocialLoading() : super(isLoading: true);
}

class RegisterWithSocialSuccess extends RegisterWithEmailState {
  const RegisterWithSocialSuccess() : super(isLoading: false);
}

class RegisterWithSocialError extends RegisterWithEmailState {
  final String message;

  const RegisterWithSocialError({required this.message})
      : super(isLoading: false);
}
