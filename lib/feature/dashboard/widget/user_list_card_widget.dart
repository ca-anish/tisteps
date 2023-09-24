import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tisteps/feature/dashboard/page/profile_details_page.dart';
import 'package:tisteps/model/user_details_model.dart';

class UserListCardWidget extends StatelessWidget {
  final UserDetailsModel userList;
  const UserListCardWidget({super.key, required this.userList});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
            color: Color(0xFFE1F6FF),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              Column(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(userList.avatar,
                        width: 100, height: 125, fit: BoxFit.cover))
              ]),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 10, left: 10, right: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Name : ',
                                      style: TextStyle(fontFamily: 'SFPro')),
                                  Text(
                                      '${userList.firstName} ${userList.lastName}',
                                      style: TextStyle(
                                          fontFamily: 'SFPro',
                                          fontWeight: FontWeight.w600))
                                ]),
                            SizedBox(height: 10),
                            Row(children: [
                              Text(userList.email,
                                  style: TextStyle(fontFamily: 'SFPro'))
                            ]),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                    child: Text('View Details',
                                        style: TextStyle(fontFamily: 'SFPro')),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileDetailsPage(
                                                      userId:
                                                      userList.id)));
                                    }))
                          ])))
            ])));
  }
}
