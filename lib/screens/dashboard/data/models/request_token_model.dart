class RequestTokenModel {
  String? check;
  bool? success;
  String? otpId;
  String? verificationKey;

  RequestTokenModel({
    this.check,
    this.success,
    this.otpId,
    this.verificationKey,
  });

  RequestTokenModel.fromJson(Map<String, dynamic> json) {
    check = json['check'];
    success = json['success'];
    otpId = json['otpId'];
    verificationKey = json['verificationKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['check'] = check;
    data['success'] = success;
    data['otpId'] = otpId;
    data['verificationKey'] = verificationKey;
    return data;
  }
}
