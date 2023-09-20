import 'package:flutter/material.dart';
import 'package:tisteps/feature/dashboard/page/dashbard.dart';
import 'package:tisteps/feature/dashboard/widget/coming_soon.widget.dart';
import 'package:tisteps/shared/utils/constants.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  var appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          height: 70,
          color: Colors.black26,
          child: Row(children: [
            GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8),
                    child: Icon(Icons.menu, color: Colors.white, size: 30))),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: SizedBox(
                  height: 50,
                  width: 60,
                  child: Image(image: AssetImage('assets/images/logo.png')))),
            const Spacer(),
            InkWell(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const ComingSoonWidget()));
              },
                child: const Icon(Icons.person, color: Colors.white, size: 30)),
            PopupMenuButton(
                offset: Offset(0.0, appBarHeight),
                color: Colors.white,
                icon: const Icon(Icons.keyboard_arrow_down_sharp,
                    color: Colors.white, size: 30),
                onSelected: (result) {
                  switch (result) {
                    case 0:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                      break;
                    case 1:
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                      break;
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Settings',style: TextStyle(fontSize: 13)),
                            Icon(Icons.settings, color: Colors.black)
                          ])
                    ),
                    PopupMenuItem(
                        value: 1,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Logout',style: TextStyle(fontSize: 13)),
                              Icon(Icons.logout, color: Colors.black)
                            ]))
                  ];
                })
          ])),
    ));
  }
}
