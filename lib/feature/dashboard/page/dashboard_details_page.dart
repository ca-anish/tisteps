import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tisteps/feature/dashboard/widget/dashboard_details_container.widget.dart';

class DashBoardDetailsPage extends StatefulWidget {
  const DashBoardDetailsPage({super.key});

  @override
  State<DashBoardDetailsPage> createState() => _DashBoardDetailsPageState();
}

class _DashBoardDetailsPageState extends State<DashBoardDetailsPage> {
  String? selectedSalesValue;
  String? selectedGCMValue;

  final List<String> items = [
    'Last 7 days',
    'Last 14 days',
    'Last 30 days',
    'Last 60 days',
    'Last 90 days',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: DashboardDetailsContainer(
            selectedSalesValue: selectedSalesValue,
            salesOnChanged: onChangeTotalSales,
            items: items,
            selectedGCMValue: selectedGCMValue,
            gcmOnChanged: onChangeGCM));
  }

  void onChangeTotalSales(String? value) {
    setState(() {
      selectedSalesValue = value;
    });
  }

  void onChangeGCM(String? value) {
    setState(() {
      selectedGCMValue = value;
    });
  }
}
