import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final String? selectedValue;
  final Function(String?) onChanged;
  final List<String> items;

  const DropDownWidget(
      {super.key,
      required this.selectedValue,
      required this.onChanged,
      required this.items});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownButtonHideUnderline(
            child: DropdownButton2(
                isExpanded: true,
                hint: Row(children: const [
                  Expanded(
                      child: Text('Last 7 days',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          overflow: TextOverflow.ellipsis))
                ]),
                items: widget.items
                    .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            overflow: TextOverflow.ellipsis)))
                    .toList(),
                value: widget.selectedValue,
                onChanged: widget.onChanged,
                icon: const Icon(Icons.keyboard_arrow_down_sharp,
                    color: Colors.white),
                iconSize: 25,
                buttonHeight: 40,
                buttonWidth: 140,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black26),
                    color: Colors.black),
                buttonElevation: 2,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 180,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.black),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(-20, 0))));
  }
}
