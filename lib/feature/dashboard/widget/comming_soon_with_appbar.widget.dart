import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tisteps/shared/utils/responsive_layout.dart';

import '../../../shared/widget/app_bar_widget.dart';

class ComingSoonWithAppbarWidget extends StatelessWidget {
  const ComingSoonWithAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(fit: StackFit.expand, children: [
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
          appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 70),
              child: (ResponsiveLayout.isTinyLimit(context) ||
                      ResponsiveLayout.isTinyHeightLimit(context))
                  ? Container()
                  : const AppBarWidget(backButton: true)),
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Icon(Icons.timer, size: 80, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text('Coming Soon',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600])),
                SizedBox(height: 8),
                Text('Stay tuned for exciting updates!',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]))
              ])))
    ]));
  }
}
