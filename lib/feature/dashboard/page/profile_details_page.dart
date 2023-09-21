import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tisteps/shared/widget/app_bar_widget.dart';

import '../../../shared/utils/responsive_layout.dart';
import '../bloc/user_bloc.dart';

class ProfileDetailsPage extends StatefulWidget {
  const ProfileDetailsPage({super.key});

  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 70),
            child: (ResponsiveLayout.isTinyLimit(context) ||
                    ResponsiveLayout.isTinyHeightLimit(context))
                ? Container()
                : const AppBarWidget(backButton: true)),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserDetailsLoaded) {
            return SingleChildScrollView(
                child: Column(children: [
              Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40))),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Column(children: [
                        Image.network(state.userDetails.data.avatar),
                        SizedBox(height: 10),
                        Text(
                            '${state.userDetails.data.firstName} ${state.userDetails.data.lastName}')
                      ]))),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(state.userDetails.support.text),
                  ],
                ),
              ),
            ]));
          } else {
            return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: CircularProgressIndicator())
            ]);
          }
        }));
  }
}
