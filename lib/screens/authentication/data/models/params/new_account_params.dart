class NewAccountParams {
  String? fullName;
  String? phoneNumber;
  String? password;
  String? otpId;

  NewAccountParams({
    this.fullName,
    this.phoneNumber,
    this.password,
    this.otpId,
  });

  NewAccountParams.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    phoneNumber = json["phoneNumber"];
    password = json['password'];
    otpId = json['otpId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['otpId'] = otpId;
    return data;
  }
}
