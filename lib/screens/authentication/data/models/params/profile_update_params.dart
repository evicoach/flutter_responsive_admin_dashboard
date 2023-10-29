
class ProfileUpdateParams {
  String? userId;
  String? firstname;
  String? lastname;
  String? email;
  String? gender;
  String? dob;
  String? idExpiry;
  String? zipcode;
  String? address;
  String? phone;
  String? country;
  String? city;
  String? idType;
  String? idNumber;
  String? profileImageURL;
  String? addressProofURL;
  String? sourceOfFund;
  String? idCardURL;
  String? password;
  String? confirmPassword;
  String? oldPassword;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["userId"] = userId;
    data["firstname"] = firstname;
    data["lastname"] = lastname;
    data["email"] = email;
    data["gender"] = gender;
    data["dob"] = dob;
    data["country"] = country;
    data["city"] = city;
    data["idType"] = idType;
    data["idNumber"] = idNumber;
    data["profileImageURL"] = profileImageURL;
    data["addressProofURL"] = addressProofURL;
    data["sourceOfFund"] = sourceOfFund;
    data["idCardURL"] = idCardURL;
    data["idExpiry"] = idExpiry;
    data["phone"] = phone;
    data["postcode"] = zipcode;
    data["address"] = address;

    return data;
  }
}
