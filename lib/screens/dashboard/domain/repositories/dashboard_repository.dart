import 'package:admin/screens/dashboard/data/models/params/new_coupon_param.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/model/api_response.dart';
import '../../../../usecases/usecase.dart';
import '../../data/models/coupon_model.dart';
import '../../data/models/params/profile_update_params.dart';

abstract class DashboardRepository {
  Future<Either<Failure, ApiResponse<dynamic>>> updateUserProfile(
      ProfileUpdateParams params);

  Future<Either<Failure, List<CouponModel>>> fetchCoupons(NoParams params);

  Future<Either<Failure, List<CouponModel>>> createCoupons(
      List<NewCouponParam> params);


  // Future<Either<Failure, ApiResponse<UserModel>>> fetchUserInfo(
  //     NoParams noParams);
}
