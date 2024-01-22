import 'dart:ffi';
import 'dart:io';

import 'package:coding_challenge/core/error/exception.dart';
import 'package:coding_challenge/core/error/failure.dart';
import 'package:coding_challenge/feature/login/data/data_source/login_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/login_repository.dart';
import '../model/login_success_model.dart';

class LoginRepositoryImp extends LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImp({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, LoginModel>> authenticateUser(
      String username, String password) async {
    try {
      final result =
          await loginRemoteDataSource.authenticateUser(username, password);

      return result.fold((failure) {
        return Left(AuthenticationFailure(failure.clientMessage!));
      }, (success) {
        return Right(success);
      });
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ServerFailure('Failed to connect to internet'));
    }
  }
}
