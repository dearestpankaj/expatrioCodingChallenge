import 'package:flutter/material.dart';

import '../shared/item_dropdown.dart';

typedef SelectionValueCallback = Function(String value, int index);

class ModalDropDownButton extends StatefulWidget {
  ItemDropDown selectedItem;
  List<ItemDropDown> items;
  String? searchItemHint;
  final SelectionValueCallback itemSelectionChanged;
  int listitemIndex;

  ModalDropDownButton(
      {required this.selectedItem, required this.items, this.searchItemHint, required this.itemSelectionChanged, required this.listitemIndex});

  @override
  _ModalDropDownButtonState createState() => _ModalDropDownButtonState();
}

class _ModalDropDownButtonState extends State<ModalDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.selectedItem.label,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.left,
                    ),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ),
                onPressed: () => showModal(context),
              )),
          // Text('Selected item: $_selected')
        ],
      ),
    );
  }

  void showModal(context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: widget.searchItemHint ?? ''),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                      itemCount: widget.items.length,
                      separatorBuilder: (context, int) {
                        return const Divider();
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(
                                widget.items[index].label,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                widget.selectedItem = widget.items[index];
                                widget.itemSelectionChanged(widget.items[index].code, widget.listitemIndex);
                              });
                              Navigator.of(context).pop();
                            });
                      }),
                ),
              ],
            ),
          );
        });
  }
}
