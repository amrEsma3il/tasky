

class ErrorModel {
  String? message;
  String? statusCode;

  ErrorModel({this.message, this.statusCode});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() => {
        'msg': message,
        'statusCode': statusCode,
      };
}
