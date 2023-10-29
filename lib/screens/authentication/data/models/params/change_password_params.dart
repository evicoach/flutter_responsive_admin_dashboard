
class ChangePasswordParams {
  int? userId;
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;

  ChangePasswordParams({
    this.userId,
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
  });

  ChangePasswordParams.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
    confirmPassword = json['confirmNewPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['oldPassword'] = oldPassword;
    data['newPassword'] = newPassword;
    data['confirmNewPassword'] = confirmPassword;
    return data;
  }
}
