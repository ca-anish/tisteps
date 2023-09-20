import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tisteps/shared/utils/constants.dart';
import 'package:tisteps/shared/widget/dropdown_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';


class GCSGraphPage extends StatefulWidget {
  const GCSGraphPage({super.key});

  @override
  _GCSGraphPageState createState() => _GCSGraphPageState();
}

class _GCSGraphPageState extends State<GCSGraphPage> {
  String? selectedValue;

  List<_SalesData> data = [
    _SalesData('Online\nSports\nBetting\n(OSB)', 7),
    _SalesData('Online\nCasino', 4),
    _SalesData('Other\nGames', 2),
    _SalesData('Hotel\nPremise\nCasino', 5),
    _SalesData('Public\nOnline\nLottery\n(POL)', 1),
    _SalesData('Stand\nAlone\nCasino', 0),
  ];

  final List<String> items = [
    'Last 7 days',
    'Last 14 days',
    'Last 30 days',
    'Last 60 days',
    'Last 90 days',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Card(
                    color: Constants.lightPink,
                    elevation: 3,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          ToggleSwitch(
                            activeBgColor: const [Colors.black],
                            inactiveBgColor: Colors.white,
                            initialLabelIndex: 0,
                            cornerRadius: 20.0,
                            totalSwitches: 2,
                            labels: const ['Game Category', 'Operator Sales'],
                            onToggle: (index) {
                              print('switched to: $index');
                            }
                          ),
                            DropDownWidget(selectedValue: selectedValue, onChanged: onChangeTotalSales, items: items)
                        ])
                      ),
                      const SizedBox(height: 10),
                      SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(text: 'Game Category Sales',textStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 18)),
                          // Enable legend
                          // Enable tooltip
                          primaryYAxis: NumericAxis(interval: 2),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<_SalesData, String>>[
                            ColumnSeries<_SalesData, String>(
                                dataSource: data,
                                xValueMapper: (_SalesData sales, _) => sales.year,
                                yValueMapper: (_SalesData sales, _) => sales.sales,
                                name: 'Sales',
                                // Enable data label
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true))
                          ]),
                      Text('Game Categories',style: TextStyle(fontSize: 18)),
                      SizedBox(height: 15)
                    ]))
              ]
            )));
  }

  void onChangeTotalSales(String? value) {
    setState(() {
      selectedValue = value;
    });
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
