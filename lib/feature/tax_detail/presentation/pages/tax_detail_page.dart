import 'package:coding_challenge/feature/tax_detail/domain/entity/tax_residence_detail.dart';
import 'package:coding_challenge/feature/tax_detail/presentation/bloc/tax_detail_bloc.dart';
import 'package:coding_challenge/feature/tax_detail/presentation/widget/tax_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_conainer.dart';
import '../../../../widgets/button_widget.dart';

class TaxDetailPage extends StatefulWidget {
  const TaxDetailPage({super.key});

  @override
  State<TaxDetailPage> createState() => _TaxDetailPageState();
}

class _TaxDetailPageState extends State<TaxDetailPage> {
  late TaxDetailBloc myBloc; // Declare the BLoC instance
  late List<TaxResidence> taxResidencyList = [];
  bool checkedValue = false;
  int errorIndex = -1;

  @override
  void initState() {
    super.initState();
    myBloc = locator<TaxDetailBloc>();
    myBloc.add(OnTaxDetailRequestedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaxDetailBloc>(
        create: (context) => myBloc,
        child: BlocListener<TaxDetailBloc, TaxDetailState>(
          listener: (context, state) {
            if (state is TaxDetailFetchingSuccessState) {
              setState(() {
                taxResidencyList = state.taxResidencies;
              });
            } else if (state is TaxDetailSavingSuccessState) {
              Navigator.pop(context);
            } else if (state is TaxDetailMissingInfoSubmissionState) {
              errorIndex = state.index;
              setState(() {});
            } else if (state is AddNewTaxCountryState) {
              taxResidencyList.add(state.taxResidence);
              setState(() {});
            } else if (state is SelfDeclarationCheckboxSelectionState) {
              checkedValue = state.isChecked;
              setState(() {});
            }
          },
          child: taxDeclarationUI(),
        ));
  }

  Widget taxDeclarationUI() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              titleText(),
              taxInfoListView(),
              addMoreTaxCountry(),
              confirmationCheckbox(),
              saveButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget titleText() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        "Declaration of financial information",
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget taxInfoListView() {
    return ListView.builder(
      itemCount: taxResidencyList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => TaxDetailItem(
        taxResidence: taxResidencyList[index],
        countrySelectionChanged: getUpdatedCountryCode,
        index: index,
        taxCountryRemove: removeTaxCountry,
        taxIdCharacterChanged: setUpdatedTaxId,
        isError: (errorIndex == index) ? true : false,
      ),
    );
  }

  Widget confirmationCheckbox() {
    return Row(
      children: [
        Checkbox(
            value: checkedValue,
            onChanged: (newVal) {
              setState(() {
                checkedValue = newVal ?? false;
              });
            }),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                side: const BorderSide(width: 0, color: Colors.white),
              ),
              onPressed: () {
                myBloc.add(OnSelfDeclarationCheckboxSelectionEvent(
                    isChecked: !checkedValue));
              },
              child: const Text(
                'I confirm that above tax residancy and US self-declaration is true and accurate.',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.justify,
              )),
        ),
      ],
    );
  }

  Widget addMoreTaxCountry() {
    return Row(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              side: const BorderSide(width: 0, color: Colors.white),
            ),
            onPressed: () {
              myBloc.add(OnAddTaxCountryEvent());
            },
            child: Text(
              '+ ADD ANOTHER',
              style: TextStyle(color: Theme.of(context).primaryColor),
            )),
        const Spacer()
      ],
    );
  }

  Widget saveButton() {
    return ButtonWidget(
        text: 'SAVE',
        press: () {
          if (checkedValue) {
            myBloc.add(OnTaxDetailSaveEvent(taxResidencies: taxResidencyList));
          }
        },
        BackgroundColor: Theme.of(context).primaryColor);
  }

  void getUpdatedCountryCode(String code, int index) {
    taxResidencyList[index].country = code;
  }

  void setUpdatedTaxId(String taxId, int index) {
    taxResidencyList[index].id = taxId;
  }

  void removeTaxCountry(int index) {
    taxResidencyList.removeAt(index);
    setState(() {});
  }
}
