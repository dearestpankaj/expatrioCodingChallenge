
import 'package:coding_challenge/feature/login/data/data_source/user_auth_local_data_source.dart';

import '../../domain/repository/user_auth_repository.dart';

class UserAuthRepositoryImp extends UserAuthRepository {
  UserAuthLocalDataSource userAuthLocalDataSource;

  UserAuthRepositoryImp({required this.userAuthLocalDataSource});

  @override
  Future<String?> getAuthenticationToken() {
    return userAuthLocalDataSource.getAuthenticationToken();
  }

  @override
  saveAuthenticationToken(String authToken) {
    userAuthLocalDataSource.saveAuthenticationToken(authToken);
  }

  @override
  Future<String?> getUserId() {
    return userAuthLocalDataSource.getUserId();
  }

  @override
  saveUserID(String userId) {
    userAuthLocalDataSource.saveUserId(userId);
  }

}