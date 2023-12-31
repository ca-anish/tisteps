import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tisteps/feature/dashboard/widget/coming_soon.widget.dart';
import 'package:tisteps/feature/dashboard/widget/comming_soon_with_appbar.widget.dart';
import 'package:tisteps/shared/utils/responsive_layout.dart';
import 'package:tisteps/shared/widget/app_bar_widget.dart';
import 'package:tisteps/shared/widget/drawer_widget.dart';

import 'dashboard_details_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentIndex = 1;

  List<Widget> _icons = [
    Icon(Icons.auto_graph_sharp, size: 30),
    Icon(Icons.dashboard, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(4, 9, 35, 1),
                      Color.fromRGBO(39, 105, 171, 1)
                    ],
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter))),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
                preferredSize: const Size(double.infinity, 70),
                child: (ResponsiveLayout.isTinyLimit(context) ||
                        ResponsiveLayout.isTinyHeightLimit(context))
                    ? Container()
                    : const AppBarWidget(backButton: false)),
            body: currentIndex == 0
                ? const ComingSoonWidget()
                : currentIndex == 1
                    ? const DashBoardDetailsPage()
                    : const ComingSoonWidget(),
            drawer: DrawerPage(drawerOnTap: drawerOnTap),
            bottomNavigationBar: ResponsiveLayout.isPhone(context)
                ? CurvedNavigationBar(
                    buttonBackgroundColor: Colors.orangeAccent,
                    index: currentIndex,
                    backgroundColor: Colors.black26,
                    items: _icons,
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    })
                : const SizedBox()),
      ],
    );
  }

  void drawerOnTap(int? index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const DashBoard()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ComingSoonWithAppbarWidget()));
    }
  }
}
