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
          Column(children: [
            Container(
              color: _currentIndex == 0 ? Colors.black26 : Colors.transparent,
              child: UserAccountsDrawerHeader(
                  accountName: Text('Oflutter.com'),
                  accountEmail: Text('example@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                          child: Image.asset('assets/images/profile.png',
                              fit: BoxFit.cover, width: 90, height: 90))),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/background.jpg')))),
            ),
            ...List.generate(
                _buttonNames.length,
                (index) => Column(children: [
                      Container(
                          decoration: index == _currentIndex
                              ? BoxDecoration(
                                  color: index == _currentIndex
                                      ? Colors.black26
                                      : Colors.black)
                              : null,
                          child: ListTile(
                              title: Text(_buttonNames[index].title,
                                  style: TextStyle(
                                      color: index == _currentIndex
                                          ? Colors.white
                                          : Colors.black)),
                              leading: Padding(
                                  padding:
                                      const EdgeInsets.all(Constants.kPadding),
                                  child: Icon(_buttonNames[index].icon,
                                      color: index == _currentIndex
                                          ? Colors.orangeAccent
                                          : Colors.black)),
                              onTap: () {
                                setState(() {
                                  print(index);
                                  _currentIndex = index;
                                  widget.drawerOnTap(index);
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))))
                    ]))
          ])
        ]));
  }
}
