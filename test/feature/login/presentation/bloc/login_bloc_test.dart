import 'package:bloc_test/bloc_test.dart';
import 'package:coding_challenge/core/error/failure.dart';
import 'package:coding_challenge/feature/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late LoginBloc loginBloc;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginBloc = LoginBloc(mockLoginUseCase);
  });

  test(
      'initial state should be empty',
          () {
        expect(loginBloc.state, LoginInitial());
      }
  );

  blocTest<LoginBloc,LoginState>(
      'should emit [LoginLoading, LoginSuccess] when login is success',
      build: () {
        when(
            mockLoginUseCase.execute('username', 'password')
        ).thenAnswer((_) async => const Right(true));
        return loginBloc;
      },
      act: (bloc) => bloc.add(OnLoginRequested(username: 'username', password: 'password')),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        LoginLoading(),
        LoginSuccess()
      ]
  );

  blocTest<LoginBloc,LoginState>(
      'should emit [LoginLoading, LoginFailure] when login is failed',
      build: () {
        when(
            mockLoginUseCase.execute('username', 'password')
        ).thenAnswer((_) async => const Left(AuthenticationFailure('login failed')));
        return loginBloc;
      },
      act: (bloc) => bloc.add(OnLoginRequested(username: 'username', password: 'password')),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        LoginLoading(),
        LoginFailure(message: 'login failed')
      ]
  );
}