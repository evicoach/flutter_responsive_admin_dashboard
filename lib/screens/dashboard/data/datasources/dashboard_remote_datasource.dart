import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/data/model/params.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/model/api_response.dart';
import '../../../../core/network/api_client.dart';
import '../../../../usecases/usecase.dart';
import '../../../../utility/endpoints.dart';
import '../../../../utility/network_util.dart';
import '../../../authentication/data/datasources/auth_remote_datasource.dart';
import '../models/otp_verified_model.dart';
import '../models/params/change_password_params.dart';
import '../models/params/login_params.dart';
import '../models/params/new_account_params.dart';
import '../models/params/profile_update_params.dart';
import '../models/params/verify_otp_params.dart';
import '../models/request_token_model.dart';
import '../models/user_model.dart';
import 'auth_local_datasource.dart';

abstract class DashboardRemoteDataSource {
  Future<ApiResponse<UserModel>> login(LoginParams params);

  Future<ApiResponse<UserModel>> fetchUserInfo(NoParams noParams);

  Future<ApiResponse<UserModel>> signup(NewAccountParams params);

  Future<dynamic> forgotPasswordRequestToken(ForgotPasswordParam param);

  Future<dynamic> forgotPasswordResetPassword(PasswordResetParams params);

  Future<dynamic> changePassword(ChangePasswordParams param);

  Future<dynamic> resetPassword(ForgotPasswordParam params);

  Future<ApiResponse<RequestTokenModel>> requestToken(
      RequestTokenParams params);

  Future<ApiResponse> updateUserProfile(ProfileUpdateParams params);

  Future<ApiResponse<OtpVerifiedModel>> verifyOtp(VerifyOtpParams params);
}


class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final AuthLocalDatasource _localDatasource;

  DashboardRemoteDataSourceImpl(this._localDatasource);

  @override
  Future<ApiResponse<UserModel>> login(LoginParams params) async {
    Dio client = ApiClient.getClient(hasTimeout: true);
    Response response;
    try {
      response = await client.post(Endpoints.login, data: params.toJson());
      var data = response.data;
      if (data["status"] == false) {
        throw ServerException(message: data["message"]);
      }
      return ApiResponse<UserModel>.fromJson(data);
    } on DioException catch (exception) {
      throw DioUtil.handleDioError(exception);
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future resetPassword(ForgotPasswordParam params) async {
    Dio client = ApiClient.getClient(hasTimeout: true);
    Response response;
    try {
      response = await client.post(Endpoints.forgotPassword,
          queryParameters: params.toJson());
      var data = json.decode(response.data);
      if (data["status"] == false) {
        throw ServerException(message: data["message"]);
      }
      return data;
    } on DioError catch (e) {
      throw DioUtil.handleDioError(e);
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<UserModel>> signup(NewAccountParams params) async {
    debugPrint("Creating account with params: ${params.toJson()}");
    Dio client = ApiClient.getClient(hasTimeout: true);
    Response response;
    try {
      response = await client.post(Endpoints.signup, data: params.toJson());
      var data = response.data;
      if (data["status"] == false) {
        throw ServerException(message: data["message"]);
      }
      return ApiResponse<UserModel>.fromJson(Map<String, dynamic>.from(data));
    } on DioException catch (e) {
      throw DioUtil.handleDioError(e);
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<RequestTokenModel>> requestToken(
      RequestTokenParams params) async {
    Dio client = ApiClient.getClient(hasTimeout: true);
    Response response;
    try {
      response = await client.get(Endpoints.requestToken,
          queryParameters: params.toJson());
      if (response.data["status"] == "failed") {
        throw ServerException(message: response.data["message"]);
      }

      return ApiResponse<RequestTokenModel>.fromJson(response.data);
    } on DioException catch (e) {
      throw DioUtil.handleDioError(e);
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future forgotPasswordRequestToken(ForgotPasswordParam param) async {
    Dio client = ApiClient.getClient(hasTimeout: true);
    Response response;
    try {
      response = await client.get(Endpoints.forgotPassword,
          queryParameters: param.toJson());

      if (response.data["status"] == false) {
        throw ServerException(message: response.data["message"]);
      }
      return response.data;
    } on DioError catch (exception) {
      throw DioUtil.handleDioError(exception);
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future changePassword(ChangePasswordParams params) async {
    print("Change password params are ${params.toJson()}");
    Dio client = ApiClient.getClient(hasTimeout: true, headers: {
      'content-type': 'application/json',
    });
    Response response;
    try {
      response = await client.post(Endpoints.changePassword,
          queryParameters: params.toJson());
      var data = json.decode(response.data);
      if (data["status"] == false) {
        throw ServerException(message: data["message"]);
      }
      return ApiResponse<RequestTokenModel>.fromJson(data);
    } on DioException catch (exception) {
      throw DioUtil.handleDioError(exception);
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future forgotPasswordResetPassword(PasswordResetParams params) async {
    // Dio client = ApiClient.getClient(hasTimeout: true);
    // Response response;
    // try {
    //   response =
    //       // await client.post(Endpoints.forgotPassword, data: params.toJson());
    //       await client.post(Endpoints.forgotPassword, data: params.toJson());
    //   if (response.data["status"] == false) {
    //     throw ServerException(message: response.data["message"]);
    //   }
    //   return response.data;
    // } on DioError catch (exception) {
    //   throw DioUtil.handleDioError(exception);
    // } on ServerException {
    //   rethrow;
    // }
  }

  // @override
  // Future getCustomerToken(GetCustomerTokenParams params) async {
  //   Dio client = ApiClient.getClient(hasTimeout: true);
  //   Response response;
  //   try {
  //     response =
  //         await client.post(Endpoints.requestToken, data: params.toJson());
  //     if (response.data["status"] == false) {
  //       throw ServerException(message: response.data["message"]);
  //     }
  //     return response.data;
  //   } on DioError catch (exception) {
  //     throw DioUtil.handleDioError(exception);
  //   } on ServerException {
  //     rethrow;
  //   }
  // }

  // @override
  // Future validateCustomerToken(ValidateCustomerTokenParams params) async {
  //   Dio client = ApiClient.getClient(
  //       hasTimeout: true, hasToken: true, token: params.token!);
  //   Response response;
  //   try {
  //     response =
  //         await client.post(Endpoints.validateToken, data: params.toJson());
  //     if (response.data["status"] == false) {
  //       throw ServerException(message: response.data["message"]);
  //     }
  //     return response.data;
  //   } on DioError catch (exception) {
  //     throw DioUtil.handleDioError(exception);
  //   } on ServerException {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<RoleModel>> getRoles(NoParams params) async {
  //   Dio client = ApiClient.getClient(hasTimeout: true);
  //   List<RoleModel> roles = [];
  //   Response response;
  //   try {
  //     response = await client.get(Endpoints.roles);
  //
  //     Map<String, dynamic> responseRoles = json.decode(response.data);
  //     if (responseRoles["status"] == false) {
  //       throw ServerException(message: response.data["message"]);
  //     }
  //     // Allowing only agent and Direct Customer
  //     roles = (responseRoles["data"] as List)
  //         .where((roleJson) => roleJson["id"] == 5 || roleJson["id"] == 6)
  //         .map((e) => RoleModel.fromJson(e))
  //         .toList();
  //     return roles;
  //   } on DioError catch (exception) {
  //     throw DioUtil.handleDioError(exception);
  //   } on ServerException {
  //     rethrow;
  //   }
  // }

  @override
  Future<ApiResponse> updateUserProfile(ProfileUpdateParams params) async {
    Dio client = ApiClient.getClient(hasTimeout: true, headers: {
      'content-type': 'application/json',
    });
    try {
      Response response = await client.post(Endpoints.updateProfile,
          queryParameters: params.toJson());
      var data = json.decode(response.data);
      if (data["status"] == false) {
        throw ServerException(message: data["message"]);
      }
      return ApiResponse.fromJson(Map<String, dynamic>.from(data));
    } on DioException catch (exception) {
      throw DioUtil.handleDioError(exception);
    } on ServerException {
      rethrow;
    }
  }

  // @override
  // Future<ApiResponse> logIssue(LogIssueParams params) async {
  //   Dio client = ApiClient.getClient(hasTimeout: true, headers: {
  //     'content-type': 'application/json',
  //   });
  //   try {
  //     Response response = await client.post(Endpoints.logIssue,
  //         queryParameters: params.toJson());
  //     var data = json.decode(response.data);
  //     if (data["status"] == false) {
  //       throw ServerException(message: data["message"]);
  //     }
  //     return ApiResponse.fromJson(Map<String, dynamic>.from(data));
  //   } on DioException catch (exception) {
  //     throw DioUtil.handleDioError(exception);
  //   } on ServerException {
  //     rethrow;
  //   }
  // }

  @override
  Future<ApiResponse<OtpVerifiedModel>> verifyOtp(
      VerifyOtpParams params) async {
    Dio client = ApiClient.getClient(hasTimeout: true, headers: {
      'content-type': 'application/json',
    });
    try {
      Response response =
          await client.post(Endpoints.verifyOtp, data: params.toJson());
      var data = response.data;
      if (data["status"] == "failed") {
        throw ServerException(message: data["message"]);
      }
      return ApiResponse<OtpVerifiedModel>.fromJson(
          Map<String, dynamic>.from(data));
    } on DioException catch (exception) {
      throw DioUtil.handleDioError(exception);
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<UserModel>> fetchUserInfo(NoParams noParams) async {
    Dio client = ApiClient.getClient(
      hasTimeout: true,
      hasToken: true,
      token: noParams.token!,
    );
    try {
      Response response = await client.get(Endpoints.userInfo);
      var data = response.data;
      if (data["status"] == false) {
        print("Data error is]]]]]]]]]]]]]]]]] ${data["error"]}");
        throw ServerException(message: data["error"]);
      }
      return ApiResponse<UserModel>.fromJson(Map<String, dynamic>.from(data));
    } on DioException catch (exception) {
      throw DioUtil.handleDioError(exception);
    } on ServerException {
      rethrow;
    }
  }
}
