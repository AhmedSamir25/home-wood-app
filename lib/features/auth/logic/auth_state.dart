part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


final class CreateUserSuccess extends AuthState {}

final class FieldCreateUser extends AuthState {
  final String message;
   FieldCreateUser({required this.message});
}

final class LoginUserSuccess extends AuthState {}

final class FieldLoginUser extends AuthState {
  final String message;
  FieldLoginUser({required this.message});
}
final class SendTokenSuccess extends AuthState{}

final class FieldSendToken extends AuthState{
  final String message;
  FieldSendToken({required this.message});
}

final class ResetPasswordSuccess extends AuthState{}

final class FieldResetPassword extends AuthState{}