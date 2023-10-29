import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/model/api_response.dart';
import '../../../../usecases/usecase.dart';
import '../../../authentication/data/datasources/auth_remote_datasource.dart';
import '../../data/models/coupon_model.dart';
import '../../data/models/params/change_password_params.dart';
import '../../data/models/params/profile_update_params.dart';
import '../../data/models/request_token_model.dart';
import '../../data/models/user_model.dart';

abstract class DashboardRepository {
  Future<Either<Failure, ApiResponse<dynamic>>> updateUserProfile(
      ProfileUpdateParams params);

  Future<Either<Failure, List<CouponModel>>> fetchCoupons(
      NoParams params);

  Future<Either<Failure, ApiResponse<UserModel>>> fetchUserInfo(
      NoParams noParams);
}
