abstract class UserAuthRepository {
  saveAuthenticationToken(String authToken);
  Future<String?> getAuthenticationToken();
  saveUserID(String userId);
  Future<String?> getUserId();
}