import 'package:equatable/equatable.dart';

class LoginFailedModal extends Equatable{
  String? message;
  String? clientMessage;
  String? errorCode;
  Data? data;

  LoginFailedModal(
      {this.message, this.clientMessage, this.errorCode, this.data});

  LoginFailedModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    clientMessage = json['clientMessage'];
    errorCode = json['errorCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['clientMessage'] = clientMessage;
    data['errorCode'] = errorCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Data {
  int? usedAttempts;
  int? remainingAttempts;

  Data({this.usedAttempts, this.remainingAttempts});

  Data.fromJson(Map<String, dynamic> json) {
    usedAttempts = json['usedAttempts'];
    remainingAttempts = json['remainingAttempts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['usedAttempts'] = usedAttempts;
    data['remainingAttempts'] = remainingAttempts;
    return data;
  }
}
