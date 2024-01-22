import 'dart:async';
import 'package:coding_challenge/feature/tax_detail/domain/usecase/tax_detail_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../shared/countries_constants.dart';
import '../../../../shared/item_dropdown.dart';
import '../../domain/entity/tax_residence_detail.dart';

part 'tax_detail_event.dart';
part 'tax_detail_state.dart';

class TaxDetailBloc extends Bloc<TaxDetailEvent, TaxDetailState> {
  final TaxDetailUseCase _taxDetailUseCase;

  TaxDetailBloc(this._taxDetailUseCase) : super(TaxDetailInitial()) {
    on<OnTaxDetailRequestedEvent>((event, emit) async {
      emit(TaxDetailFetchingState());
      final result = await _taxDetailUseCase.getTaxDetail();

      result.fold(
          (failure) => {emit(TaxDetailFetchingFailureState(failure.message))},
          (success) => {
                if (success != null)
                  {
                    emit(TaxDetailFetchingSuccessState(
                        taxResidencies: success ?? []))
                  }
              });
    });

    on<OnTaxDetailSaveEvent>((event, emit) async {
      emit(TaxDetailSavingState());
      bool isValidTaxDetail = true;
      for (final (index, taxDetails) in event.taxResidencies.indexed) {
        if (taxDetails.country.isEmpty || taxDetails.id.isEmpty) {
          isValidTaxDetail = false;
          emit(TaxDetailMissingInfoSubmissionState(index: index));
          break;
        }
      }
      if (isValidTaxDetail) {
        final result =
            await _taxDetailUseCase.saveTaxDetail(event.taxResidencies);
        result.fold(
            (failure) => {emit(TaxDetailSaveFailureState(failure.message))},
            (success) => {emit(TaxDetailSavingSuccessState())});
      }
    });

    on<OnAddTaxCountryEvent>((event, emit) {
      final defaultCountry = getCountryListItems()[0];
      emit(AddNewTaxCountryState(
          taxResidence: TaxResidence(
              country: defaultCountry.code, id: '', isPrimary: false)));
    });

    on<OnSelfDeclarationCheckboxSelectionEvent>((event, emit) {
      emit(SelfDeclarationCheckboxSelectionState(isChecked: event.isChecked));
    });
  }

  List<ItemDropDown> getCountryListItems() {
    return CountriesConstants.getCountryListItems();
  }
}
