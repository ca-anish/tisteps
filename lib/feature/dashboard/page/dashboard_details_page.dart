import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tisteps/feature/dashboard/bloc/user_bloc.dart';
import 'package:tisteps/feature/dashboard/widget/dashboard_details_container.widget.dart';

class DashBoardDetailsPage extends StatefulWidget {
  const DashBoardDetailsPage({super.key});

  @override
  State<DashBoardDetailsPage> createState() => _DashBoardDetailsPageState();
}

class _DashBoardDetailsPageState extends State<DashBoardDetailsPage> {
  int countIncrement = 1;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData(){
    context.read<UserBloc>().add(UserListEvent(page: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: DashboardDetailsContainer());
  }
}
