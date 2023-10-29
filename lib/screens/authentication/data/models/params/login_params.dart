class LoginParams {
  String? username;
  String? password;
  String? deviceId;

  LoginParams({this.username, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["username"] = username;
    data["password"] = password;
    if (deviceId != null) data["deviceId"] = deviceId;
    return data;
  }

  LoginParams.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    password = json["[password"];
    deviceId = json["deviceId"];
  }
}
