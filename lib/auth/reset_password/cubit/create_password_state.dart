part of 'create_password_cubit.dart';

@immutable
abstract class CreatePasswordState {}

class CreatePasswordInitial extends CreatePasswordState {}
class RefreshUi extends CreatePasswordState {}
