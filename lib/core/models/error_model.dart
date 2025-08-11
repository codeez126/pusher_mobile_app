// To parse this JSON data, do
//
//     final errorModel = errorModelFromMap(jsonString);

import 'dart:convert';

class ErrorModel {
  ErrorModel({
    this.statusCode,
    this.message =
        'Unknown Error Occurred', //this is default message in case of null messages list
    this.error,
  });

  int? statusCode;
  String message;
  String? error;

  factory ErrorModel.fromJson(String str) =>
      ErrorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromMap(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: (json["statusCode"] ?? 0).toInt(),
      message: json["message"] is List ? json["message"][0] : json["message"],
      error: json["error"],
    );
  }

  Map<String, dynamic> toMap() => {
    "statusCode": statusCode,
    "message": message,
    "error": error,
  };
}
