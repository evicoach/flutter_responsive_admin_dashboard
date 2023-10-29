import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/model/api_response.dart';
import '../../../../usecases/usecase.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/otp_verified_model.dart';
import '../models/params/change_password_params.dart';
import '../models/params/login_params.dart';
import '../models/params/new_account_params.dart';
import '../models/params/profile_update_params.dart';
import '../models/params/verify_otp_params.dart';
import '../models/request_token_model.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  final AuthLocalDatasource localDataSource;

  const AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ApiResponse<UserModel>>> signup(
      NewAccountParams params) async {
    try {
      var user = await remoteDataSource.signup(params);
      localDataSource.cacheCustomerToken(user.data!.token!);
      localDataSource.cacheCustomerDetails(user.data!);
      return Right(user);
    } on ServerException catch (exception) {
      return Left(ServerFailure(
        message: exception.message,
        data: exception.data,
      ));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<UserModel>>> login(
      LoginParams params) async {
    try {
      var response = await remoteDataSource.login(params);
      localDataSource.cacheCustomerToken(response.data!.token!);
      localDataSource.cacheCustomerDetails(response.data!);
      localDataSource.cacheLoginParams(params);
      return Right(response);
    } on ServerException catch (exception) {
      return Left(ServerFailure(
        message: exception.message,
        data: exception.data,
      ));
    }
  }

  @override
  Future<Either<Failure, dynamic>> resetPassword(
      ForgotPasswordParam params) async {
    try {
      var data = await remoteDataSource.resetPassword(params);
      return Right(data);
    } on ServerException catch (exception) {
      return Left(ServerFailure(
        message: exception.message,
        data: exception.data,
      ));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<RequestTokenModel>>> requestToken(
      RequestTokenParams params) async {
    try {
      var apiResponse = await remoteDataSource.requestToken(params);
      return Right(apiResponse);
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(
          message: exception.message,
          data: exception.data,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> forgotPasswordRequestToken(
      ForgotPasswordParam params) async {
    try {
      var responseData =
          await remoteDataSource.forgotPasswordRequestToken(params);
      return Right(responseData);
    } on ServerException catch (exception) {
      return Left(
          ServerFailure(message: exception.message, data: exception.data));
    }
  }

  @override
  Future<Either<Failure, dynamic>> changePassword(
      ChangePasswordParams params) async {
    try {
      var responseData = await remoteDataSource.changePassword(params);
      return Right(responseData);
    } on ServerException catch (exception) {
      return Left(
          ServerFailure(message: exception.message, data: exception.data));
    }
  }

  @override
  Future<Either<Failure, ApiResponse>> updateUserProfile(
      ProfileUpdateParams params) async {
    try {
      params.userId = localDataSource.getCustomerDetails().userId;
      var responseData = await remoteDataSource.updateUserProfile(params);
      return Right(responseData);
    } on ServerException catch (exception) {
      return Left(
          ServerFailure(message: exception.message, data: exception.data));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<OtpVerifiedModel>>> verifyOtp(
      VerifyOtpParams params) async {
    try {
      var responseData = await remoteDataSource.verifyOtp(params);
      return Right(responseData);
    } on ServerException catch (exception) {
      return Left(
          ServerFailure(message: exception.message, data: exception.data));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<UserModel>>> fetchUserInfo(
      NoParams noParams) async {
    try {
      noParams.token = localDataSource.getCustomerToken();
      var responseData = await remoteDataSource.fetchUserInfo(noParams);
      return Right(responseData);
    } on ServerException catch (exception) {
      return Left(
          ServerFailure(message: exception.message, data: exception.data));
    }
  }
}
