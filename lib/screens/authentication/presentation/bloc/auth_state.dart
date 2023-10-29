part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RequestingToken extends AuthState {}

class RequestTokenError extends AuthState {
  final String? message;
  final Map<String, dynamic>? data;

  RequestTokenError({this.message, this.data});
}

class RequestTokenLoaded extends AuthState {
  final String? message;
  final RequestTokenModel data;

  RequestTokenLoaded(this.message, {required this.data});
}

///////////////////

class VerifyingOtp extends AuthState {}

class VerifyOtpError extends AuthState {
  final String? message;
  final Map<String, dynamic>? data;

  VerifyOtpError({this.message, this.data});
}

class VerifiedOtpLoaded extends AuthState {
  final String? message;
  final OtpVerifiedModel data;

  VerifiedOtpLoaded(this.message, {required this.data});
}

///////////////////////////////

class ResendingToken extends AuthState {}

class ResendTokenError extends AuthState {
  final String? message;
  final Map<String, dynamic>? data;

  ResendTokenError({this.message, this.data});
}

class ResendTokenLoaded extends AuthState {
  final String? message;
  final RequestTokenModel data;

  ResendTokenLoaded(this.message, {required this.data});
}

////////////////////////////////////////

class CreatingAccount extends AuthState {}

class CreateAccountError extends AuthState {
  final String? message;
  final Map<String, dynamic>? data;

  CreateAccountError({this.message, this.data});
}

class AccountCreated extends AuthState {
  final String? message;
  final UserModel data;

  AccountCreated(this.message, {required this.data});
}

/////////////////////////////////////////

class LoggingIn extends AuthState {}

class LoginError extends AuthState {
  final String? message;
  final Map<String, dynamic>? data;

  LoginError({this.message, this.data});
}

class LoginSuccess extends AuthState {
  final String? message;
  final UserModel data;

  LoginSuccess(this.message, {required this.data});
}

/////////////////////////////////////////

class FetchingUserInformation extends AuthState {}

class FetchUserInformationError extends AuthState {
  final String? message;
  final Map<String, dynamic>? data;

  FetchUserInformationError({this.message, this.data});
}

class FetchUserInformationSuccess extends AuthState {
  final String? message;
  final UserModel data;

  FetchUserInformationSuccess(this.message, {required this.data});
}
