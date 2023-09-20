import 'package:flutter/material.dart';
import 'package:tisteps/shared/utils/constants.dart';

class DashBoardCardWidget extends StatelessWidget {
  final String? selectedValue;
  final String subHeaderText;
  final String amountText;
  final String titleText;
  final IconData icons;
  final Function(String?) onChanged;
  final List<String> items;
  const DashBoardCardWidget(
      {super.key,
      required this.selectedValue,
      required this.onChanged,
      required this.items,
      required this.titleText,
      required this.icons,
      required this.subHeaderText,
      required this.amountText});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Constants.lightPink,
        elevation: 3,
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                width: double.infinity,
                child: Column(children: [
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(height: 1, color: Colors.black)),
                  const SizedBox(height: 10),
                  Icon(icons, size: 40),
                  const SizedBox(height: 5),
                  Text(subHeaderText),
                  const SizedBox(height: 10),
                  Text(amountText,
                      style: const TextStyle(
                          fontSize: 25, color: Constants.appYellow))
                ]))));
  }
}
