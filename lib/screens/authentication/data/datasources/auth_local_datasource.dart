import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/params/login_params.dart';
import '../models/user_model.dart';

abstract class AuthLocalDatasource {
  Future<void> cacheCustomerDetails(UserModel user);

  UserModel getCustomerDetails();

  Future<void> cacheCustomerToken(String token);

  String? getCustomerToken();

  bool isFirstTime();

  void logout();

  // bool isPolicyAlreadyAccepted();

  Future<void> setPolicyAccepted(bool accepted);

  Future<void> cacheLoginParams(LoginParams params);

  Future<LoginParams> getLoginParams();
}

const customerDetailsKey = "customer_details";
const loginParams = "login_params";
const firstTimeOpen = "firstTimeOpen";
const isDataPolicyAccepted = "isPolicyAccepted";
const customerAuthTokenKey = "customer_auth_token_key";

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheCustomerDetails(UserModel user) {
    return sharedPreferences.setString(
        customerDetailsKey,
        json.encode(
          user.toJson(),
        ));
  }

  @override
  UserModel getCustomerDetails() {
    final customerJsonString = sharedPreferences.getString(customerDetailsKey);
    if (customerJsonString != null) {
      return UserModel.fromJson(json.decode(customerJsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  bool isFirstTime() {
    return sharedPreferences.containsKey(firstTimeOpen);
  }

  @override
  Future<void> cacheCustomerToken(String token) {
    return sharedPreferences.setString(customerAuthTokenKey, token);
  }

  @override
  String? getCustomerToken() {
    return sharedPreferences.getString(customerAuthTokenKey);
  }

  // @override
  // bool isPolicyAlreadyAccepted() {
  //   return sharedPreferences.containsKey(isDataPolicyAccepted);
  // }

  @override
  Future<void> setPolicyAccepted(bool accepted) async {
    await sharedPreferences.setBool(isDataPolicyAccepted, accepted);
  }

  @override
  void logout() async {
    await sharedPreferences.remove(customerAuthTokenKey);
  }

  @override
  Future<void> cacheLoginParams(LoginParams params) async {
    print("saving login params ${params.toJson()}");
    await sharedPreferences.setString(loginParams, json.encode(params.toJson()));
  }

  @override
  Future<LoginParams> getLoginParams() async {
    final loginParamString = sharedPreferences.getString(loginParams);
    if (loginParamString != null) {
      return LoginParams.fromJson(json.decode(loginParamString));
    } else {
      throw CacheException();
    }
  }
}
