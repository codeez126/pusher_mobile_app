class UserModel {
  final int id;
  final String authType;
  final String? profileImage;
  final String? firstName;
  final String? lastName;
  final String? dob;
  final int gender;
  final String? email;
  final String phone;
  final bool isVerified;
  final int isRegistered;
  final int isOnboarded;
  final String? address;
  final String? latitude;
  final String? longitude;
  final String type;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.authType,
    this.profileImage,
    this.firstName,
    this.lastName,
    this.dob,
    required this.gender,
    this.email,
    required this.phone,
    required this.isVerified,
    required this.isRegistered,
    required this.isOnboarded,
    this.address,
    this.latitude,
    this.longitude,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

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
}
