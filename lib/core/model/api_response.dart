
import '../../screens/authentication/data/models/otp_verified_model.dart';
import '../../screens/authentication/data/models/request_token_model.dart';
import '../../screens/authentication/data/models/user_model.dart';

class ApiResponse<T> {
  String? message;
  bool? status;
  T? data;

  ApiResponse(this.message, this.status, this.data);

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? _fromJson<T>(json['data']) : null;
  }

  V _fromJson<V>(Map<String, dynamic> json) {
    if (V == RequestTokenModel) return RequestTokenModel.fromJson(json) as V;
    if (V == OtpVerifiedModel) return OtpVerifiedModel.fromJson(json) as V;
    if (V == UserModel) return UserModel.fromJson(json) as V;

    throw ArgumentError("Unsupported generic type: $T");
  }
}
