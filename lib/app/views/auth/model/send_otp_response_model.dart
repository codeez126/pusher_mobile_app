class SendOtpResponseModel {
  bool? status;
  String? message;
  dynamic data;
  dynamic errors;

  SendOtpResponseModel({this.status, this.message, this.data, this.errors});

  SendOtpResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    data['errors'] = errors;
    return data;
  }
}
