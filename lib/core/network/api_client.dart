import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../utility/endpoints.dart';

class ApiClient {
  static Dio getClient(
      {bool hasToken = false,
      String token = '',
      bool hasTimeout = true,
      int timeout = 100000,
      Map? headers}) {
    Dio dio = Dio();
    dio.options.baseUrl = Endpoints.baseUrl;
    if (hasTimeout) {
      dio.options.connectTimeout = Duration(milliseconds: timeout);
      dio.options.receiveTimeout = Duration(milliseconds: timeout);
    }

    if (hasToken && token.isNotEmpty) {
      dio.options.headers = {
        'content-type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      };
    }

    if (headers != null) {
      Map<String, dynamic> newHeader = {
        ...dio.options.headers,
        ...headers,
      };
      print("The new headers $newHeader");
      dio.options.headers = newHeader;
    }

    // add interceptors
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      debugPrint(
          'Request interceptors running ${options.baseUrl}${options.path}');
      debugPrint('Request interceptors running::request data ${options.data}');
      debugPrint(
          'Request interceptors running::query parameters ${options.queryParameters}');
      // Do something before request is sent
      return handler.next(options); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onResponse: (response, handler) {
      if (kDebugMode) {
        print("Response status code ${response.statusCode}");
        print("Response from request ${response.data}");
      }
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onError: (DioException error, handler) {
      Response? errorResponse;
      if (error.type == DioExceptionType.badResponse) {
        debugPrint("Error from dio onError(): ${error.response?.data}");
        errorResponse = error.response;
      } else {
        String errorMessage = "";
        // DioUtil.handleError(error);

        // Take note that 600 is not a real status code, it was used to indicate client dio error like network connection failure
        Response newResponse = Response(
            statusCode: 600,
            data: {'message': errorMessage},
            requestOptions: error.requestOptions);
        errorResponse = newResponse;
      }
      return handler.next(error); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
    }));
    return dio;
  }
}
