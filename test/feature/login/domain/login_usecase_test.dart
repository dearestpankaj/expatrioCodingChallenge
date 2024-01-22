
import 'package:coding_challenge/core/error/failure.dart';
import 'package:coding_challenge/feature/login/data/model/login_success_model.dart';
import 'package:coding_challenge/feature/login/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  late MockLoginRepository mockLoginRepository;
  late MockUserAuthRepository mockUserAuthRepository;
  late LoginUseCase loginUseCase;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    mockUserAuthRepository = MockUserAuthRepository();
    loginUseCase = LoginUseCase(loginRepository: mockLoginRepository, userAuthRepository: mockUserAuthRepository);
  });

  const username = 'username';
  const password = 'password';
  final loginModel = LoginModel(accessToken: 'access token', userId: 1);
  final emptyLoginModel = LoginModel(accessToken: '', userId: 0);
  
  test(
      'should get true for authentication from the repository',
          () async {
        when(
            mockLoginRepository.authenticateUser(username, password)
        ).thenAnswer((_) async => Right(loginModel) );
        when(
          mockUserAuthRepository.saveAuthenticationToken(loginModel.accessToken)
        ).thenAnswer((_) => null);
        when(
            mockUserAuthRepository.saveUserID('1')
        ).thenAnswer((_) => null);

        final result = await loginUseCase.execute(username, password);

        expect(result, const Right(true));
      }
  );

  test(
      'should get TokenExpiredFailure for invalid authentication from the repository',
          () async {
        when(
            mockLoginRepository.authenticateUser(username, password)
        ).thenAnswer((_) async => Left(AuthenticationFailure('message')) );
        
        final result = await loginUseCase.execute(username, password);

        expect(result, const Left(AuthenticationFailure('message')));
      }
  );

  test(
      'should get TokenExpiredFailure for expired token from the repository',
          () async {
            when(
                mockLoginRepository.authenticateUser(username, password)
            ).thenAnswer((_) async => Right(emptyLoginModel) );

            final result = await loginUseCase.execute(username, password);

            expect(result, const Left(TokenExpiredFailure('Token Expired')));
      }
  );
}