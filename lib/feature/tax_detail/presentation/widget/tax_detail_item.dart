import 'dart:convert';

import 'package:coding_challenge/shared/countries_constants.dart';
import 'package:coding_challenge/shared/item_dropdown.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/model_dropdown_button.dart';
import '../../domain/entity/tax_residence_detail.dart';

class TaxDetailItem extends StatefulWidget {
  TaxResidence taxResidence;
  final SelectionValueCallback countrySelectionChanged;
  int index;
  final Function(int index) taxCountryRemove;
  final Function(String taxIdValue, int index) taxIdCharacterChanged;
  final bool isError;
  TaxDetailItem(
      {super.key,
      required this.taxResidence,
      required this.countrySelectionChanged,
      required this.index,
      required this.taxCountryRemove,
        required this.taxIdCharacterChanged,
      this.isError = false});

  @override
  State<TaxDetailItem> createState() => _TaxDetailItemState();
}

class _TaxDetailItemState extends State<TaxDetailItem> {
  final textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    textEditingController.addListener(_textEditConrolTextChangeListner);
  }

  void _textEditConrolTextChangeListner() {
    final text = textEditingController.text;
    widget.taxIdCharacterChanged(text, widget.index);
    print('Second text field: $text (${text.characters.length})');
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textEditingController.value =
        TextEditingValue(text: widget.taxResidence.id);
    print('tax detail item');
    print(textEditingController);
    print(widget.taxResidence);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'WHICH COUNTRY SERVES AS YOUR PRIMARY TAX RESIDENCE?*',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          ModalDropDownButton(
            selectedItem: searchByCountryCode(),
            items: getCountryListItems(),
            searchItemHint: 'Search for Country',
            itemSelectionChanged: widget.countrySelectionChanged,
            listitemIndex: widget.index,
          ),
          const SizedBox(height: 10),
          Text('TAX IDENTIFICATION NUMBER*',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 10),
          SizedBox(
            height: 40.0,
            child: TextFormField(
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  hintText: 'Tax ID or N/A'),
              controller: textEditingController,
            ),
          ),
          Visibility(
              visible: widget.isError,
              child: const Text('Please enter Tax id and select country',
                  style: TextStyle(color: Colors.red))),
          widget.index > 0
              ? Row(
                  children: [
                    const Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          side: const BorderSide(width: 0, color: Colors.white),
                        ),
                        onPressed: () =>
                            {widget.taxCountryRemove(widget.index)},
                        child: const Text(
                          '-REMOVE',
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  List<ItemDropDown> getCountryListItems() {
    return CountriesConstants.getCountryListItems();
  }

  ItemDropDown searchByCountryCode() {
    if (widget.taxResidence.country.isNotEmpty) {
      return getCountryListItems().firstWhere((element) =>
          element.code.toLowerCase() ==
          widget.taxResidence.country.toLowerCase());
    } else {
      return getCountryListItems()[0];
    }
  }

  ItemDropDown searchByCountryName() {
    final country = getCountryListItems().firstWhere((element) =>
        element.label.toLowerCase() ==
        widget.taxResidence.country.toLowerCase());
    return country ?? getCountryListItems()[0];
  }
}
