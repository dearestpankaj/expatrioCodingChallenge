import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/login_success_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> authenticateUser(
      String username, String password);
}
