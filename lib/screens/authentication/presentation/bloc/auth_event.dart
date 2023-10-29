part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RequestTokenEvent extends AuthEvent {
  final RequestTokenParams params;

  RequestTokenEvent({required this.params});
}

class VerifyOtpEvent extends AuthEvent {
  final VerifyOtpParams params;

  VerifyOtpEvent({required this.params});
}

class ResendTokenEvent extends AuthEvent {
  final RequestTokenParams params;

  ResendTokenEvent({required this.params});
}

class CreateAccountEvent extends AuthEvent {
  final NewAccountParams params;

  CreateAccountEvent({required this.params});
}

class LoginEvent extends AuthEvent {
  final LoginParams params;

  LoginEvent({required this.params});
}

class FetchUserInformationEvent extends AuthEvent {}
