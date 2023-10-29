class BeneficiaryModel {
  String? id;
  String? name;
  String? image;
  String? username;

  BeneficiaryModel({this.id, this.name, this.image, this.username});

  BeneficiaryModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    name = json['name'] ?? '';
    image = json['image'] ?? '';
    username = json['username'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['username'] = username;
    return data;
  }
}
