import '../../../../../core/data/model/params.dart';

class NewCouponParam extends Params {
  String? id;
  String? provider;
  bool? active;
  bool? week;
  bool? month;
  bool? year;
  String? code;
  String? description;
  String? expiresAt;

  NewCouponParam({
    this.id,
    this.provider,
    this.active,
    this.week,
    this.month,
    this.year,
    this.code,
    this.description,
    this.expiresAt,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["provider"] = provider;
    data["active"] = active;
    data["week"] = week;
    data["month"] = month;
    data["year"] = year;
    data["code"] = code;
    data["description"] = description;
    data["expiresAt"] = expiresAt;
    return data;
  }

  NewCouponParam.fromJson(Map<String, dynamic> json) {
    provider = json['provider'];
    active = json["active"];
    week = json['week'];
    month = json['month'];
    year = json['year'];
    code = json['code'];
    description = json['description'];
    expiresAt = json['expiresAt'];
  }
}
