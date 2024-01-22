import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class UserAuthLocalDataSource {
  Future<String?> getAuthenticationToken();
  saveAuthenticationToken(String authToken);
  saveUserId(String userId);
  Future<String?> getUserId();
}
class UserAuthLocalDataSourceImpl extends UserAuthLocalDataSource {
  FlutterSecureStorage storage;
  final String _authTokenKey = 'AuthTokenKey';
  final String _userIdKey = 'userIdKey';

  UserAuthLocalDataSourceImpl({required this.storage});

  @override
  Future<String?> getAuthenticationToken() {
    return storage.read(key: _authTokenKey);
  }

  @override
  saveAuthenticationToken(String authToken) {
    storage.write(key: _authTokenKey, value: authToken);
  }

  @override
  Future<String?> getUserId() {
    return storage.read(key: _userIdKey);
  }

  @override
  saveUserId(String userId) {
    storage.write(key: _userIdKey, value: userId);
  }
  
}