import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../core/error/exceptions.dart';

class DioUtil {
  static String _handleError(DioException error) {
    String errorDescription = "";
    switch (error.type) {
      case DioExceptionType.connectionError:
        errorDescription = "Connection error, please try again";
        break;
      case DioExceptionType.cancel:
        errorDescription = "Request was cancelled, please try again";
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription =
            "Connection timeout due to internet connection, please try again";
        break;
      case DioExceptionType.sendTimeout:
        errorDescription =
            "Connection timeout due to internet connection, please try again";
        break;
      case DioExceptionType.unknown:
        errorDescription =
            "Connection failed. Check your internet connection and try again";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription =
            "Receive timeout due to internet connection, please try again";
        break;
      default:
        errorDescription = "";
    }
    return errorDescription;
  }

  static ServerException handleDioError(DioError error) {
    try {
      print("Handling dio error ${error}");
      print("Handling dio error 2 ${error.response}");
      String errorMessage = _handleError(error);
      if (errorMessage.isNotEmpty) {
        return ServerException(message: errorMessage);
      }
      if (error.response != null) {
        var data = error.response?.data;
        debugPrint("Error runtime Type is ${data.runtimeType}");
        debugPrint("Error runtime Type is zzzz ${data}");
        if (data["error"] != null || data["status"] == false) {
          return ServerException(
              message: (data["error"] as String), data: data["data"]);
        }

        if (data["error"] == null || data["status"] == false) {
          return ServerException(
              message: (data["message"] as String), data: data["data"]);
        }
      }

      return ServerException(message: error.message);
    } catch (exception) {
      return ServerException(
          message: "Something went wrong",
          data: {"data": "Something went wrong"});
    }
  }
}
