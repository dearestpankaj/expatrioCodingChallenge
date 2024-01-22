import 'package:bloc_test/bloc_test.dart';
import 'package:coding_challenge/core/error/failure.dart';
import 'package:coding_challenge/feature/tax_detail/domain/entity/tax_residence_detail.dart';
import 'package:coding_challenge/feature/tax_detail/presentation/bloc/tax_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTaxDetailUseCase mockTaxDetailUseCase;
  late TaxDetailBloc taxDetailBloc;

  setUp(() {
    mockTaxDetailUseCase = MockTaxDetailUseCase();
    taxDetailBloc = TaxDetailBloc(mockTaxDetailUseCase);
  });

  test(
      'initial state should be empty',
          () {
        expect(taxDetailBloc.state, TaxDetailInitial());
      }
  );

  List<TaxResidence> taxResidences = [TaxResidence(country: 'Germany', id: '34345543453', isPrimary: true), TaxResidence(country: 'India', id: '1223234', isPrimary: false)];

  group('Fetch test details', () {
    blocTest<TaxDetailBloc, TaxDetailState>(
        'should emit [TaxDetailFetchingState, TaxDetailFetchingSuccessState] when tax detail is received',
        build: () {
          when(
              mockTaxDetailUseCase.getTaxDetail()
          ).thenAnswer((_) async => Right(taxResidences));
          return taxDetailBloc;
        },
        act: (bloc) => bloc.add(OnTaxDetailRequestedEvent()),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TaxDetailFetchingState(),
          TaxDetailFetchingSuccessState(taxResidencies: taxResidences)
        ]
    );

    blocTest<TaxDetailBloc,TaxDetailState>(
        'should emit [TaxDetailFetchingState, TaxDetailFetchingFailureState] when tax detail request is failed',
        build: () {
          when(
              mockTaxDetailUseCase.getTaxDetail()
          ).thenAnswer((_) async => Left(TokenExpiredFailure('Token Expired')));
          return taxDetailBloc;
        },
        act: (bloc) => bloc.add(OnTaxDetailRequestedEvent()),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TaxDetailFetchingState(),
          TaxDetailFetchingFailureState('Token Expired')
        ]
    );
  });

  group('Save test details', () {
    blocTest<TaxDetailBloc, TaxDetailState>(
        'should emit [OnTaxDetailSaveEvent, TaxDetailSavingSuccessState] when tax detail is received',
        build: () {
          when(
              mockTaxDetailUseCase.saveTaxDetail(taxResidences)
          ).thenAnswer((_) async => Right(null));
          return taxDetailBloc;
        },
        act: (bloc) => bloc.add(OnTaxDetailSaveEvent(taxResidencies: taxResidences)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TaxDetailSavingState(),
          TaxDetailSavingSuccessState()
        ]
    );

    blocTest<TaxDetailBloc,TaxDetailState>(
        'should emit [OnTaxDetailSaveEvent, TaxDetailSaveFailureState] when tax detail request is failed',
        build: () {
          when(
              mockTaxDetailUseCase.saveTaxDetail(taxResidences)
          ).thenAnswer((_) async => Left(TokenExpiredFailure('Token Expired')));
          return taxDetailBloc;
        },
        act: (bloc) => bloc.add(OnTaxDetailSaveEvent(taxResidencies: taxResidences)),
        wait: const Duration(milliseconds: 500),
        expect: () => [
          TaxDetailSavingState(),
          TaxDetailSaveFailureState('Token Expired')
        ]
    );
  });

  blocTest<TaxDetailBloc,TaxDetailState>(
      'should emit AddNewTaxCountryState when a tax country is added',
      build: () {
        return taxDetailBloc;
      },
      act: (bloc) => bloc.add(OnAddTaxCountryEvent()),
      expect: () => [
        AddNewTaxCountryState(taxResidence: TaxResidence(
            country: 'AF', id: '', isPrimary: false))
      ]
  );

  blocTest<TaxDetailBloc,TaxDetailState>(
      'should emit AddNewTaxCountryState when a tax country is added',
      build: () {
        return taxDetailBloc;
      },
      act: (bloc) => bloc.add(OnSelfDeclarationCheckboxSelectionEvent(isChecked: true)),
      expect: () => [
        SelfDeclarationCheckboxSelectionState(isChecked: true)
      ]
  );
}