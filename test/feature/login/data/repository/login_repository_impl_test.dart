import 'package:coding_challenge/feature/login/data/model/login_success_model.dart';
import 'package:coding_challenge/feature/login/data/repository/login_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockLoginRemoteDataSource mockLoginRemoteDataSource;
  late LoginRepositoryImp loginRepositoryImp;

  setUp(() {
    mockLoginRemoteDataSource = MockLoginRemoteDataSource();
    loginRepositoryImp =
        LoginRepositoryImp(loginRemoteDataSource: mockLoginRemoteDataSource);
  });

  const username = 'username';
  const password = 'password';
  final loginModel = LoginModel(accessToken: 'access token', userId: 1);

  test('user should be authenticated and return login model', () async {

    when(mockLoginRemoteDataSource.authenticateUser(username, password))
        .thenAnswer((_) async => Right(loginModel));

    final result = await loginRepositoryImp.authenticateUser(username, password);

    expect(true, result.isRight());
    result.fold((l) {
    }, (r) {
      expect(r, isA<LoginModel>());
    });
  });
}
