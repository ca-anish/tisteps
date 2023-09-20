import 'package:flutter/material.dart';
import 'package:tisteps/feature/dashboard/widget/dashboard_card.widget.dart';

class DashboardDetailsContainer extends StatelessWidget {
  final String? selectedSalesValue;
  final String? selectedGCMValue;
  final Function(String?) salesOnChanged;
  final Function(String?) gcmOnChanged;
  final List<String> items;

  const DashboardDetailsContainer(
      {super.key,
      required this.selectedSalesValue,
      required this.salesOnChanged,
      required this.items,
      required this.selectedGCMValue,
      required this.gcmOnChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [
          Row(children: [
            Text('Dashboard',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800))
          ]),
          SizedBox(height: 20),
          DashBoardCardWidget(
              onChanged: salesOnChanged,
              items: items,
              selectedValue: selectedSalesValue,
              titleText: 'Total Sales',
              icons: Icons.auto_graph,
              subHeaderText: 'Total Sales',
              amountText: '₦ 2,531'),
          const SizedBox(height: 15),
          DashBoardCardWidget(
              onChanged: gcmOnChanged,
              items: items,
              selectedValue: selectedGCMValue,
              titleText: 'Total GCM/Tax',
              icons: Icons.add_chart,
              subHeaderText: 'Total GCM/TAX',
              amountText: '₦ 12,060,000'),
          const SizedBox(height: 15)
        ]));
  }
}
