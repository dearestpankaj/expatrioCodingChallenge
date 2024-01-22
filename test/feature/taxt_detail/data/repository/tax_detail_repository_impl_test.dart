import 'package:coding_challenge/feature/tax_detail/data/model/tax_detail_model.dart';
import 'package:coding_challenge/feature/tax_detail/data/repository/tax_detail_repository_impl.dart';
import 'package:coding_challenge/feature/tax_detail/domain/entity/tax_residence_detail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTaxDetailRemoteDataSource mockTaxDetailRemoteDataSource;
  late TaxDetailRepositoryImpl taxDetailRepositoryImpl;

  setUp(() {
    mockTaxDetailRemoteDataSource = MockTaxDetailRemoteDataSource();
    taxDetailRepositoryImpl =
        TaxDetailRepositoryImpl(taxDetailRemoteDataSource: mockTaxDetailRemoteDataSource);
  });

  final taxDetailModel = TexDetailModel();

  test('TexDetailModel should be returned', () async {

    when(mockTaxDetailRemoteDataSource.getTaxDetail('1', 'accessToken'))
        .thenAnswer((_) async => Right(taxDetailModel));

    final result = await taxDetailRepositoryImpl.getTaxDetail('1', 'accessToken');

    expect(true, result.isRight());

  });

  test('TexDetailModel should be returned', () async {

    when(mockTaxDetailRemoteDataSource.saveTaxDetail('1', 'accessToken',[TaxResidence(country: 'FR', id: '1232', isPrimary: false)]))
        .thenAnswer((_) async => Right(taxDetailModel));

    final result = await taxDetailRepositoryImpl.saveTaxDetail('1', 'accessToken', [TaxResidence(country: 'FR', id: '1232', isPrimary: false)]);

    expect(true, result.isRight());

  });
}