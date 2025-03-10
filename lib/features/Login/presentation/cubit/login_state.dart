part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginModel? data;
  LoginSuccess({this.data});
}

final class LoginError extends LoginState {
  final Failure? error;
  LoginError({this.error});
}

final class Authenticated extends LoginState {}

final class Unauthenticated extends LoginState {}
