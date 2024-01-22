part of 'tax_detail_bloc.dart';

@immutable
abstract class TaxDetailEvent {}

class TaxDetailFetchEvent extends TaxDetailEvent {}

class OnTaxDetailSaveEvent extends TaxDetailEvent {
  List<TaxResidence> taxResidencies;
  OnTaxDetailSaveEvent({ required this.taxResidencies});
}

class OnAddTaxCountryEvent extends TaxDetailEvent {}

class OnSelfDeclarationCheckboxSelectionEvent extends TaxDetailEvent {
  bool isChecked;
  OnSelfDeclarationCheckboxSelectionEvent({ required this.isChecked});
}

final class OnTaxDetailRequestedEvent extends TaxDetailEvent {}