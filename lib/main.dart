import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tisteps/feature/authandicate/page/login_page.dart';
import 'package:tisteps/feature/dashboard/page/dashbard.dart';

import 'feature/dashboard/bloc/user_bloc.dart';

void main() {
  runApp(MultiProvider(providers: [
    BlocProvider<UserBloc>(create: (context) {
      return UserBloc();
    }),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TISteps',
      theme: ThemeData(
        fontFamily: 'SFPro',
        primarySwatch: Colors.blue),
      home: LoginPage()
    );
  }
}

