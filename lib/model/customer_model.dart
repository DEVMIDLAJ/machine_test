import 'data.dart';

class CustomerModel {
  String? message;
  bool? status;
  Data? data;

  CustomerModel({this.message, this.status, this.data});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        message: json['message'] as String?,
        status: json['status'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
        'data': data?.toJson(),
      };
}
