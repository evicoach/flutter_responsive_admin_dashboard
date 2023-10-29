class CouponProvider {
  String? name;
  String? slug;
  String? image;

  CouponProvider({this.name, this.slug, this.image});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["name"] = name;
    data["slug"] = slug;
    data["image"] = image;
    return data;
  }

  CouponProvider.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    slug = json["slug"];
    image = json["image"];
  }
}
