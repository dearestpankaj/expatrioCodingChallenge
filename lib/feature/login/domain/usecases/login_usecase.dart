import 'package:coding_challenge/feature/login/data/model/login_success_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repository/login_repository.dart';
import '../repository/user_auth_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;
  final UserAuthRepository userAuthRepository;

  LoginUseCase({required this.loginRepository, required this.userAuthRepository});

  Future<Either<Failure, bool>> execute(String username, String password) async {
    final authenticatedUser = await loginRepository.authenticateUser(username, password);

    return authenticatedUser.fold((failure) {
      return Left(failure);
    }, (success) {
      final accessToken = success.accessToken ?? '';
      final userId = success.userId ?? 0;

      if (accessToken.isNotEmpty && userId > 0) {
        userAuthRepository.saveAuthenticationToken(accessToken);
        userAuthRepository.saveUserID('$userId');
        return const Right(true);
      }
      return const Left(TokenExpiredFailure('Token Expired'));
    });
  }
}
