class OtpVerifiedModel {
  String? status;
  String? detail;
  String? check;

  OtpVerifiedModel({this.status, this.detail, this.check});

  OtpVerifiedModel.fromJson(Map<String, dynamic> json) {
    check = json['status'];
    detail = json['detail'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['detail'] = detail;
    data['check'] = check;
    return data;
  }
}
