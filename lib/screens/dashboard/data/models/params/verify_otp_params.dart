class VerifyOtpParams {
  String? code;
  String? check;
  String? verificationKey;

  VerifyOtpParams({
    this.code,
    this.check,
    this.verificationKey,
  });

  VerifyOtpParams.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    check = json["check"];
    verificationKey = json['verificationKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['check'] = check;
    data["verificationKey"] = verificationKey;
    return data;
  }
}
