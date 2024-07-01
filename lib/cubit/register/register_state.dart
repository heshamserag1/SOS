// ignore_for_file: must_be_immutable

part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  String? error;

  RegisterErrorState(
    String string,
  );
}

class UserCreateSuccessState extends RegisterState {
  late final String uid;

  UserCreateSuccessState(this.uid);
}

class UserCreateErrorState extends RegisterState {
  final String error;

  UserCreateErrorState(this.error);
}

class ShowPassword extends RegisterState {}
