import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tisteps/model/user_details_model.dart';

class ProfileCardWidget extends StatelessWidget {
  final UserDetailsModel profileDetails;

  const ProfileCardWidget({super.key, required this.profileDetails});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: height * 0.41,
        padding: const EdgeInsets.all(10),
        child: Container(child: LayoutBuilder(builder: (context, constraints) {
          double innerHeight = constraints.maxHeight;
          double innerWidth = constraints.maxWidth;
          return Stack(fit: StackFit.expand, children: [
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: innerHeight * 0.75,
                    width: innerWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Column(children: [
                      SizedBox(height: 70),
                      Text(
                          '${profileDetails.firstName} ${profileDetails.lastName}',
                          style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontFamily: 'Nunito',
                              fontSize: 28)),
                      SizedBox(height: 5),
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(profileDetails.email,
                                    style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 22))
                              ])),
                      SizedBox(height: 5),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              Text('Profile Id',
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontFamily: 'Nunito',
                                      fontSize: 25)),
                              Text(profileDetails.id.toString(),
                                  style: TextStyle(
                                      color: Color.fromRGBO(39, 105, 171, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: 25))
                            ]),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 8),
                                child: Container(
                                    height: 50,
                                    width: 3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.grey))),
                            Column(children: [
                              Text('Status   ',
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontFamily: 'Nunito',
                                      fontSize: 25)),
                              Text('online   ',
                                  style: TextStyle(
                                      color: Color.fromRGBO(39, 105, 171, 1),
                                      fontFamily: 'Nunito',
                                      fontSize: 25))
                            ])
                          ])
                    ]))),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                    child: Container(
                        width: innerWidth * 0.45,
                        child: ClipOval(
                            child: Image.network(profileDetails.avatar,
                                fit: BoxFit.cover)))))
          ]);
        })));
  }
}
