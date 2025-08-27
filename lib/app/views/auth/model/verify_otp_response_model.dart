class VerifyOtpReponseModel {
  bool? status;
  String? message;
  Data? data;
  dynamic errors;

  VerifyOtpReponseModel({this.status, this.message, this.data, this.errors});

  VerifyOtpReponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = this.errors;
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['expires_in'] = this.expiresIn;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auth_type'] = this.authType;
    data['profile_image'] = this.profileImage;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['is_verified'] = this.isVerified;
    data['is_registered'] = this.isRegistered;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
