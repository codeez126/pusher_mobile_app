class VerifyOtpReponseModel {
  bool? status;
  String? message;
  Data? data;
  dynamic errors;

  VerifyOtpReponseModel({this.status, this.message, this.data, this.errors});

  VerifyOtpReponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = errors;
    return data;
  }
}

class Data {
  String? token;
  User? user;
  int? expiresIn;

  Data({this.token, this.user, this.expiresIn});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['expires_in'] = expiresIn;
    return data;
  }
}

class User {
  int? id;
  String? authType;
  dynamic profileImage;
  dynamic firstName;
  dynamic lastName;
  dynamic dob;
  int? gender;
  dynamic email;
  String? phone;
  bool? isVerified;
  int? isRegistered;
  dynamic address;
  dynamic latitude;
  dynamic longitude;
  String? type;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.authType,
        this.profileImage,
        this.firstName,
        this.lastName,
        this.dob,
        this.gender,
        this.email,
        this.phone,
        this.isVerified,
        this.isRegistered,
        this.address,
        this.latitude,
        this.longitude,
        this.type,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authType = json['auth_type'];
    profileImage = json['profile_image'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dob = json['dob'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    isVerified = json['is_verified'];
    isRegistered = json['is_registered'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['auth_type'] = authType;
    data['profile_image'] = profileImage;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['dob'] = dob;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['is_verified'] = isVerified;
    data['is_registered'] = isRegistered;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
