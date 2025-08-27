class RegisterPhoneNumberResponseModel {
  bool? status;
  String? message;
  dynamic data;
  dynamic errors;

  RegisterPhoneNumberResponseModel({
    this.status,
    this.message,
    this.data,
    this.errors,
  });

  RegisterPhoneNumberResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];   // this might be {} or some object
    errors = json['errors']; // this might be {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    map['errors'] = errors;
    return map;
  }
}
