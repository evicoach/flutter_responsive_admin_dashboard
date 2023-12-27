class CouponModel {
  String? id;
  String? provider;
  bool? active;
  bool? week;
  bool? month;
  bool? year;
  String? code;
  String? description;
  String? expiresAt;
  String? createdAt;
  String? updatedAt;

  CouponModel({
    this.id,
    this.provider,
    this.active,
    this.week,
    this.month,
    this.year,
    this.code,
    this.description,
    this.expiresAt,
    this.createdAt,
    this.updatedAt,
  });

  CouponModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provider = json['provider'];
    active = json['active'];
    week = json['week'];
    month = json['month'];
    year = json['year'];
    code = json['code'];
    description = json['description'];
    expiresAt = json['expiresAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['provider'] = provider;
    data['active'] = active;
    data['week'] = week;
    data['month'] = month;
    data['year'] = year;
    data['code'] = code;
    data['description'] = description;
    data['expiresAt'] = expiresAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
