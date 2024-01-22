import 'package:equatable/equatable.dart';

class UserNotFoundModel extends Equatable{
  String? message;
  String? clientMessage;
  String? errorCode;
  String? data;

  UserNotFoundModel(
      {this.message, this.clientMessage, this.errorCode, this.data});

  UserNotFoundModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    clientMessage = json['clientMessage'];
    errorCode = json['errorCode'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['clientMessage'] = this.clientMessage;
    data['errorCode'] = this.errorCode;
    data['data'] = this.data;
    return data;
  }

  @override
  List<Object?> get props => [];
}
