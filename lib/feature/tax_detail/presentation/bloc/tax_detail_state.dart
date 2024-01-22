part of 'tax_detail_bloc.dart';

abstract class TaxDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TaxDetailInitial extends TaxDetailState {}

class TaxDetailFetchingState extends TaxDetailState {}

class TaxDetailFetchingFailureState extends TaxDetailState {
final String message;

  TaxDetailFetchingFailureState(this.message);
}

class TaxDetailFetchingSuccessState extends TaxDetailState {
  final List<TaxResidence> taxResidencies;
  TaxDetailFetchingSuccessState({required this.taxResidencies});
}

class TaxDetailSavingState extends TaxDetailState {}

class AddNewTaxCountryState extends TaxDetailState {
  TaxResidence taxResidence;
  AddNewTaxCountryState({required this.taxResidence});
}

class SelfDeclarationCheckboxSelectionState extends TaxDetailState {
  bool isChecked;
  SelfDeclarationCheckboxSelectionState
      ({ required this.isChecked});
}

class TaxDetailMissingInfoSubmissionState extends TaxDetailState {
  int index;
  TaxDetailMissingInfoSubmissionState({required this.index});
}

class TaxDetailSaveFailureState extends TaxDetailState {
final String message;

TaxDetailSaveFailureState(this.message);
}

class TaxDetailSavingSuccessState extends TaxDetailState {
  TaxDetailSavingSuccessState();
}

