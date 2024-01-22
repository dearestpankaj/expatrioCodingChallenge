import 'dart:convert';
import 'package:coding_challenge/core/error/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:coding_challenge/feature/login/data/model/login_success_model.dart';

import '../../../../core/constants/constants.dart';
import '../model/login_failed_modal.dart';

abstract class LoginRemoteDataSource {
  Future<Either<LoginFailedModal, LoginModel>> authenticateUser(
      String username, String password);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final http.Client client;

  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<LoginFailedModal, LoginModel>> authenticateUser(
      String username, String password) async {
    final response = await client.post(
      Uri.parse(Urls.autenticateUser),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return Right(LoginModel.fromJson(json.decode(response.body)));
    } else if (response.statusCode == 400) {
      return Left(LoginFailedModal.fromJson(json.decode(response.body)));
    } else {
      throw ServerException();
    }
  }
}
