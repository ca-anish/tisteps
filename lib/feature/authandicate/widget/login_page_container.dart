import 'package:flutter/material.dart';

import 'login_header.dart';

class LoginPageContainer extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController emailIdController;
  final Function() loginOnTap;
  final Function(String)? textFieldOnChange;
  final bool validate;
  final String? errorText;
  const LoginPageContainer(
      {super.key,
      required this.passwordController,
      required this.emailIdController,
      required this.loginOnTap,
      required this.validate,
      required this.textFieldOnChange,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
        height: height,
        child: Stack(children: <Widget>[
          Positioned(
              top: -height * .10,
              right: -MediaQuery.of(context).size.width * .4,
              child: LoginHeaderContainer()),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    SizedBox(height: height * .1),
                    const SizedBox(
                        height: 120,
                        width: 120,
                        child: Image(
                            image: AssetImage('assets/images/logo.png'))),
                    SizedBox(height: 50),
                    Column(children: <Widget>[
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Email id',
                                    style: TextStyle(
                                        fontFamily: 'SFPro',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                const SizedBox(height: 10),
                                TextField(
                                    onChanged: textFieldOnChange,
                                    controller: emailIdController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Color(0xfff3f3f4),
                                        filled: true))
                              ])),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Password',
                                    style: TextStyle(
                                        fontFamily: 'SFPro',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                const SizedBox(height: 10),
                                TextField(
                                    onChanged: textFieldOnChange,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Color(0xfff3f3f4),
                                        filled: true))
                              ]))
                    ]),
                    if (errorText != null && !validate)
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(errorText ?? '',
                              style: const TextStyle(color: Colors.red))),
                    const SizedBox(height: 30),
                    GestureDetector(
                        onTap: loginOnTap,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(2, 4),
                                      blurRadius: 5,
                                      spreadRadius: 2)
                                ],
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      validate
                                          ? Color(0xfffbb448)
                                          : Color(0xfff7892b).withOpacity(0.3),
                                      validate
                                          ? Color(0xfff7892b)
                                          : Color(0xfff7892b).withOpacity(.3)
                                    ])),
                            child: Text('Login',
                                style: TextStyle(
                                    fontFamily: 'SFPro',
                                    fontSize: 20, color: Colors.white)))),
                  ])))
        ]));
  }
}
