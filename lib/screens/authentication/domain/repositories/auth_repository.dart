import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/model/api_response.dart';
import '../../../../usecases/usecase.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/models/otp_verified_model.dart';
import '../../data/models/params/change_password_params.dart';
import '../../data/models/params/login_params.dart';
import '../../data/models/params/new_account_params.dart';
import '../../data/models/params/profile_update_params.dart';
import '../../data/models/params/verify_otp_params.dart';
import '../../data/models/request_token_model.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, ApiResponse<dynamic>>> updateUserProfile(
      ProfileUpdateParams params);



  Future<Either<Failure, ApiResponse<UserModel>>> fetchUserInfo(
      NoParams noParams);

  Future<Either<Failure, ApiResponse<UserModel>>> signup(
      NewAccountParams params);

  Future<Either<Failure, ApiResponse<UserModel>>> login(LoginParams params);

  Future<Either<Failure, ApiResponse<OtpVerifiedModel>>> verifyOtp(
      VerifyOtpParams params);

  Future<Either<Failure, dynamic>> resetPassword(ForgotPasswordParam params);

  Future<Either<Failure, dynamic>> forgotPasswordRequestToken(
      ForgotPasswordParam params);

  Future<Either<Failure, ApiResponse<RequestTokenModel>>> requestToken(
      RequestTokenParams params);

  Future<Either<Failure, dynamic>> changePassword(ChangePasswordParams params);
}
