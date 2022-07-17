part of 'register_cubit.dart';

@immutable
abstract class RegisterState {
  final bool isLoading;

  const RegisterState({this.isLoading = false});
}

class RegisterInitial extends RegisterState {}

class RefreshUi extends RegisterState {}

class RegisterLoading extends RegisterState {
  const RegisterLoading() : super(isLoading: true);
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess() : super(isLoading: false);
}

class RegisterError extends RegisterState {
  final String message;
   const RegisterError({required this.message}) : super(isLoading: false);
}
