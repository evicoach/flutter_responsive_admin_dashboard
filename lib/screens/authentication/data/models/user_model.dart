class UserModel {
  String? fullName;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? token;
  String? subscriptionId;
  String? expiresAt;
  num? balance;

  UserModel({
    this.fullName,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.balance = 0.0,
    this.token,
    this.expiresAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    subscriptionId = json['subscriptionId'];
    balance = json["balance"];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    expiresAt = json['expiresAt'];
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data["balance"] = balance;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['subscriptionId'] = subscriptionId;
    data['expiresAt'] = expiresAt;
    data['userId'] = userId;
    data['token'] = token;
    return data;
  }
}
