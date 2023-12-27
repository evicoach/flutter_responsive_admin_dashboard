import 'package:admin/screens/dashboard/data/models/coupon_model.dart';
import 'package:admin/screens/dashboard/data/models/params/new_coupon_param.dart';
import 'package:admin/usecases/usecase.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../../utility/endpoints.dart';
import '../../../../utility/network_util.dart';
import '../../../authentication/data/datasources/auth_local_datasource.dart';

abstract class DashboardRemoteDataSource {
  Future<List<CouponModel>> createCoupons(List<NewCouponParam> params);

  Future<List<CouponModel>> fetchCoupons(NoParams params);
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final AuthLocalDatasource _localDatasource;

  DashboardRemoteDataSourceImpl(this._localDatasource);

  @override
  Future<List<CouponModel>> createCoupons(List<NewCouponParam> params) async {
    Dio client = ApiClient.getClient(
        hasTimeout: true, token: _localDatasource.getCustomerToken()!);
    Response response;
    try {
      response = await client.post(Endpoints.coupons,
          data:
              params.map((newCouponParam) => newCouponParam.toJson()).toList());
      var data = response.data;
      if (data["status"] == false) {
        throw ServerException(message: data["message"]);
      }

      var couponsJson = response.data["data"] as List;
      List<CouponModel> coupons = couponsJson
          .map((couponJson) => CouponModel.fromJson(couponJson))
          .toList();
      return coupons;
    } on DioException catch (exception) {
      throw DioUtil.handleDioError(exception);
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<List<CouponModel>> fetchCoupons(NoParams params) async {
    Dio client = ApiClient.getClient(
        hasTimeout: true, token: _localDatasource.getCustomerToken()!);
    Response response;
    try {
      response = await client.get(Endpoints.coupons);
      var data = response.data;
      if (data["status"] == false) {
        throw ServerException(message: data["message"]);
      }

      var couponsJson = response.data["data"] as List;
      List<CouponModel> coupons = couponsJson
          .map((couponJson) => CouponModel.fromJson(couponJson))
          .toList();
      return coupons;
    } on DioException catch (exception) {
      throw DioUtil.handleDioError(exception);
    } on ServerException {
      rethrow;
    }
  }
}
