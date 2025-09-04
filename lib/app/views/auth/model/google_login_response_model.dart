class GoogleLoginResponseModel {
  bool? status;
  String? message;
  Data? data;
  dynamic errors;

  GoogleLoginResponseModel({this.status, this.message, this.data, this.errors});

  GoogleLoginResponseModel.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? authType;
  String? profileImage;
  String? firstName;
  String? lastName;
  dynamic dob;
  int? gender;
  String? email;
  dynamic phone;
  int? isRegistered;
  int? isOnboarded;
  int? isVerified;
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
        this.isRegistered,
        this.isOnboarded,
        this.isVerified,
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
    isRegistered = json['is_registered'];
    isOnboarded = json['is_onboarded'];
    isVerified = json['is_verified'];
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
    data['is_registered'] = this.isRegistered;
    data['is_onboarded'] = this.isOnboarded;
    data['is_verified'] = this.isVerified;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
