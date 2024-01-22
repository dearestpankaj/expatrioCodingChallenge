import 'package:equatable/equatable.dart';

class LoginModel extends Equatable{
  String? accessToken;
  String? accessTokenExpiresAt;
  String? userRole;
  bool? xpm;
  int? userId;
  Subject? subject;
  int? maxAgeSeconds;

  LoginModel(
      {this.accessToken,
      this.accessTokenExpiresAt,
      this.userRole,
      this.xpm,
      this.userId,
      this.subject,
      this.maxAgeSeconds});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    accessTokenExpiresAt = json['accessTokenExpiresAt'];
    userRole = json['userRole'];
    xpm = json['xpm'];
    userId = json['userId'];
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    maxAgeSeconds = json['maxAgeSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['accessTokenExpiresAt'] = accessTokenExpiresAt;
    data['userRole'] = userRole;
    data['xpm'] = xpm;
    data['userId'] = userId;
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    data['maxAgeSeconds'] = maxAgeSeconds;
    return data;
  }

  @override
  List<Object?> get props => [];
}

class Subject extends Equatable {
  int? userId;
  String? userUuid;
  String? lastName;
  String? firstName;
  String? fullName;
  String? email;
  String? role;
  bool? isAdmin;
  List<String>? consoleRoles;

  Subject(
      {this.userId,
      this.userUuid,
      this.lastName,
      this.firstName,
      this.fullName,
      this.email,
      this.role,
      this.isAdmin,
      this.consoleRoles});

  Subject.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userUuid = json['userUuid'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    fullName = json['fullName'];
    email = json['email'];
    role = json['role'];
    isAdmin = json['isAdmin'];
    consoleRoles = json['consoleRoles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userUuid'] = userUuid;
    data['lastName'] = lastName;
    data['firstName'] = firstName;
    data['fullName'] = fullName;
    data['email'] = email;
    data['role'] = role;
    data['isAdmin'] = isAdmin;
    data['consoleRoles'] = consoleRoles;
    return data;
  }

  @override
  List<Object?> get props => [];
}
