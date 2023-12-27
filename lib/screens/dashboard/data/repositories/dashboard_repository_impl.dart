import 'package:admin/screens/dashboard/data/models/params/new_coupon_param.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/model/api_response.dart';
import '../../../../usecases/usecase.dart';
import '../../../authentication/data/datasources/auth_local_datasource.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../models/coupon_model.dart';
import '../models/params/profile_update_params.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final AuthLocalDatasource localDataSource;

  const DashboardRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, ApiResponse>> updateUserProfile(
      ProfileUpdateParams params) async {
    throw UnimplementedError();
    // try {
    //   params.userId = localDataSource.getCustomerDetails().userId;
    //   var responseData = await remoteDataSource.updateUserProfile(params);
    //   return Right(responseData);
    // } on ServerException catch (exception) {
    //   return Left(
    //       ServerFailure(message: exception.message, data: exception.data));
    // }
  }

  // @override
  // Future<Either<Failure, ApiResponse<UserModel>>> fetchUserInfo(
  //     NoParams noParams) async {
  //   try {
  //     noParams.token = localDataSource.getCustomerToken();
  //     var responseData = await remoteDataSource.fetchUserInfo(noParams);
  //     return Right(responseData);
  //   } on ServerException catch (exception) {
  //     return Left(
  //         ServerFailure(message: exception.message, data: exception.data));
  //   }
  // }

  @override
  Future<Either<Failure, List<CouponModel>>> fetchCoupons(NoParams params)async {
    try {
      var responseData = await remoteDataSource.fetchCoupons(params);
      return Right(responseData);
    } on ServerException catch (exception) {
      return Left(
          ServerFailure(message: exception.message, data: exception.data));
    }
  }

  @override
  Future<Either<Failure, List<CouponModel>>> createCoupons(
      List<NewCouponParam> params) async {
    try {
      var responseData = await remoteDataSource.createCoupons(params);
      return Right(responseData);
    } on ServerException catch (exception) {
      return Left(
          ServerFailure(message: exception.message, data: exception.data));
    }
  }
}
