
import 'package:coding_challenge/core/error/failure.dart';
import 'package:coding_challenge/feature/login/data/model/login_success_model.dart';
import 'package:coding_challenge/feature/tax_detail/domain/entity/tax_residence_detail.dart';
import 'package:coding_challenge/feature/tax_detail/domain/usecase/tax_detail_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main(){
  late MockTaxDetailRepository mockTaxDetailRepository;
  late MockUserAuthRepository mockUserAuthRepository;
  late TaxDetailUseCase taxDetailUseCase;

  setUp(() {
    mockTaxDetailRepository = MockTaxDetailRepository();
    mockUserAuthRepository = MockUserAuthRepository();
    taxDetailUseCase = TaxDetailUseCase(taxDetailRepository: mockTaxDetailRepository, userAuthRepository: mockUserAuthRepository);
  });

  final loginModel = LoginModel(accessToken: 'access_token', userId: 1);
  final List<TaxResidence> taxResidences = [TaxResidence(country: 'Germany', id: '34345543453', isPrimary: true), TaxResidence(country: 'India', id: '1223234', isPrimary: false)];

  test(
      'should get TaxResidence list',
          () async {
        when(
            mockUserAuthRepository.getAuthenticationToken()
        ).thenAnswer((_) async => loginModel.accessToken );

        when(
            mockUserAuthRepository.getUserId()
        ).thenAnswer((_) async => '1' );

        when(
            mockTaxDetailRepository.getTaxDetail('1', loginModel.accessToken)
        ).thenAnswer((_) async => Right(taxResidences));

        final result = await taxDetailUseCase.getTaxDetail();

        expect(result,  Right(taxResidences));
      }
  );

  test(
      'should get Left(Failure) for expired token while fetching tax details',
          () async {
        when(
            mockUserAuthRepository.getAuthenticationToken()
        ).thenAnswer((_) async => '' );

        when(
            mockUserAuthRepository.getUserId()
        ).thenAnswer((_) async => '1' );

        when(
            mockTaxDetailRepository.getTaxDetail('1', loginModel.accessToken)
        ).thenAnswer((_) async => Left(TokenExpiredFailure('Token Expired')));

        final result = await taxDetailUseCase.saveTaxDetail(taxResidences);

        expect(result,  Left(TokenExpiredFailure('Token Expired')));
      }
  );

  test(
      'should get Right(void) for saving Tax details',
          () async {
        when(
            mockUserAuthRepository.getAuthenticationToken()
        ).thenAnswer((_) async => loginModel.accessToken );

        when(
            mockUserAuthRepository.getUserId()
        ).thenAnswer((_) async => '1' );

        when(
            mockTaxDetailRepository.saveTaxDetail('1', loginModel.accessToken, taxResidences)
        ).thenAnswer((_) async => Right(()));

        final result = await taxDetailUseCase.saveTaxDetail(taxResidences);

        expect(result,  Right(()));
      }
  );

  test(
      'should get Left(Failure) for error condition while saving tax details',
          () async {
        when(
            mockUserAuthRepository.getAuthenticationToken()
        ).thenAnswer((_) async => '' );

        when(
            mockUserAuthRepository.getUserId()
        ).thenAnswer((_) async => '1' );

        when(
            mockTaxDetailRepository.saveTaxDetail('1', loginModel.accessToken, taxResidences)
        ).thenAnswer((_) async => Right(()));

        final result = await taxDetailUseCase.saveTaxDetail(taxResidences);

        expect(result,  Left(TokenExpiredFailure('Token Expired')));
      }
  );
}