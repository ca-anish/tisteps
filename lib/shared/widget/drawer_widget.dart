import 'package:flutter/material.dart';
import 'package:tisteps/shared/utils/constants.dart';

class ButtonsInfo {
  String title;
  IconData icon;

  ButtonsInfo({required this.title, required this.icon});
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Dashboard", icon: Icons.dashboard),
  ButtonsInfo(title: "Operators", icon: Icons.support_agent),
];

class DrawerPage extends StatefulWidget {
  final Function(int) drawerOnTap;
  const DrawerPage({super.key, required this.drawerOnTap});

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width / 1.4,
        elevation: 0,
        child: SingleChildScrollView(
            child: Padding(
                padding:  EdgeInsets.only(top: Constants.kPadding * 1,bottom:Constants.kPadding ),
                child: Column(children: [
                  const SizedBox(height: 40),
                  ListTile(
                    title: const Text("Admin Menu",
                        style: TextStyle(color: Colors.black)),
                    trailing:  IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close, color: Colors.black))),
                  const SizedBox(height: 20),
                  ...List.generate(
                      _buttonNames.length,
                      (index) => Column(children: [
                            Container(
                                decoration: index == _currentIndex
                                    ? BoxDecoration(
                                  color: index ==_currentIndex ? Color(0xfffff8e6) : Colors.black)
                                    : null,
                                child: ListTile(
                                    title: Text(_buttonNames[index].title,
                                        style: TextStyle(color: index == _currentIndex ? Color(0xffe1ad01) : Colors.black)),
                                    leading: Padding(
                                        padding:
                                            const EdgeInsets.all(Constants.kPadding),
                                        child: Icon(_buttonNames[index].icon,
                                            color: index == _currentIndex ? Color(0xffe1ad01) : Colors.black)),
                                    onTap: () {
                                      setState(() {
                                        print(index);
                                        _currentIndex = index;
                                        widget.drawerOnTap(index);
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            const Divider(color: Colors.white, thickness: 0.1)
                          ]))
                ]))));
  }
}
