import 'package:flutter/material.dart';
import 'package:tisteps/shared/utils/constants.dart';

class Product {
  String name;
  bool enable;

  Product({this.enable = true, required this.name});
}

class OperatorSalesDetailsPage extends StatefulWidget {
  @override
  _OperatorSalesDetailsPageState createState() =>
      _OperatorSalesDetailsPageState();
}

class _OperatorSalesDetailsPageState extends State<OperatorSalesDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Card(
                    color: Constants.lightPink,
                    elevation: 3,
                    child: Column(children: [
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 15,  top: 15,bottom: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Operator Sales Details',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17)),
                              ])),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.all(width: 1, color: Colors.black),
                          children: [
                            TableRow(children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text("Operator Name",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text("Total Sales",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text("GCM/TAX",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600)))
                            ]),
                            TableRow(children: [
                              _rowText('Fortune Bet'),
                              _rowText('₦ 2,531'),
                              _rowText('₦ 63.28')
                            ]),
                            TableRow(children: [
                              _rowText('betBonanza'),
                              _rowText('₦ 100'),
                              _rowText('₦ 2.5')
                            ]),
                            TableRow(children: [
                              _rowText(' Accessbet'),
                              _rowText('₦ 0'),
                              _rowText('₦ 0')
                            ]),
                            TableRow(
                                children: [
                                  _rowText(' Ic4 '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText('Jarabet'),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText(' TDC '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText(' Supabets '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText('amaron '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText(' WGB '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText('ea games operators  '),
                                  _rowText('₦ 0'),
                                  _rowText(' ₦ 87,000 ')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText(' 1 Local operatorr '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText('Bry Game '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText('dwop '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText('EasyWin'),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText('Ic5 '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]),
                            TableRow(
                                children: [
                                  _rowText(' LIONBET '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText('BetOne'),
                                  _rowText('₦ 0'),
                                  _rowText(' ₦ 1,117,000 ')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText('1XBET'),
                                  _rowText('₦ 0'),
                                  _rowText(' ₦ 200,000')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText(' liya'),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                            TableRow(
                                children: [
                                  _rowText(' Eko Token '),
                                  _rowText('₦ 0'),
                                  _rowText('₦ 0')
                                ]
                            ),
                          ]
                        )
                      )
                    ]))
              ])),
        ));
  }

  _rowText(String? text) {
    return Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Text(
          text ?? '',
            textAlign: TextAlign.start,
          style: TextStyle(fontSize: 16,)
        ),);
  }
}
