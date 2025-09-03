import 'dart:convert';

class UserModel {
  final int? id;
  final String? authType;
  final String? profileImage;
  final String? firstName;
  final String? lastName;
  final String? dob;
  final int? gender;
  final String? email;
  final String? phone;
  final int? isVerified;
  final int? isRegistered;
  final int? isOnboarded;
  final String? address;
  final String? latitude;
  final String? longitude;
  final String? type;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.id,
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
    this.isOnboarded,
    this.address,
    this.latitude,
    this.longitude,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  UserModel copyWith({
    int? id,
    String? authType,
    String? profileImage,
    String? firstName,
    String? lastName,
    String? dob,
    int? gender,
    String? email,
    String? phone,
    int? isVerified,
    int? isRegistered,
    int? isOnboarded,
    String? address,
    String? latitude,
    String? longitude,
    String? type,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      authType: authType ?? this.authType,
      profileImage: profileImage ?? this.profileImage,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isVerified: isVerified ?? this.isVerified,
      isRegistered: isRegistered ?? this.isRegistered,
      isOnboarded: isOnboarded ?? this.isOnboarded,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    authType: json["auth_type"],
    profileImage: json["profile_image"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    dob: json["dob"],
    gender: json["gender"],
    email: json["email"],
    phone: json["phone"],
    isVerified: json["is_verified"],
    isRegistered: json["is_registered"],
    isOnboarded: json["is_onboarded"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    type: json["type"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "auth_type": authType,
    "profile_image": profileImage,
    "first_name": firstName,
    "last_name": lastName,
    "dob": dob,
    "gender": gender,
    "email": email,
    "phone": phone,
    "is_verified": isVerified,
    "is_registered": isRegistered,
    "is_onboarded": isOnboarded,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "type": type,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}
