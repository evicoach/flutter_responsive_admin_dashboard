import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../usecases/usecase.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/models/otp_verified_model.dart';
import '../../data/models/params/login_params.dart';
import '../../data/models/params/new_account_params.dart';
import '../../data/models/params/verify_otp_params.dart';
import '../../data/models/request_token_model.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecases/fetch_user_info.dart';
import '../../domain/usecases/login.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final FetchUserInfo fetchUserInfo;

  AuthBloc({
    required this.login,
    required this.fetchUserInfo,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_loginEventHandler);
    on<FetchUserInformationEvent>(_onFetchUserInformationEventHandler);
  }

  void _onFetchUserInformationEventHandler(
      FetchUserInformationEvent event, emit) async {
    emit(FetchingUserInformation());
    var userInfoOrFailure = await fetchUserInfo(NoParams());
    userInfoOrFailure.fold((failure) {
      failure as ServerFailure;
      emit(FetchUserInformationError(
          message: failure.message, data: failure.data));
    },
        (data) =>
            emit(FetchUserInformationSuccess(data.message, data: data.data!)));
  }

  void _loginEventHandler(LoginEvent event, emit) async {
    emit(LoggingIn());
    var loginOrFailure = await login(event.params);
    loginOrFailure.fold((failure) {
      failure as ServerFailure;
      emit(LoginError(message: failure.message, data: failure.data));
    }, (data) => emit(LoginSuccess(data.message, data: data.data!)));
  }
}
