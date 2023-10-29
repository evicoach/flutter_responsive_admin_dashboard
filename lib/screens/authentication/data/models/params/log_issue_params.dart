
class LogIssueParams {
  String? name;
  String? email;
  String? message;
  String? phone;

  LogIssueParams({this.name, this.email, this.message});

  LogIssueParams.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    message = json['message'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['message'] = message;
    data['phone'] = phone;
    return data;
  }
}
