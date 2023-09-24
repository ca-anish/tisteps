import 'package:flutter/material.dart';
import 'package:tisteps/shared/utils/string_validation.dart';

import '../../dashboard/page/dashbard.dart';
import '../widget/login_page_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: LoginPageContainer(
                passwordController: passwordController,
                emailIdController: emailIdController,
                validate: validate,
                errorText: errorText,
                loginOnTap: loginOnTap,
                textFieldOnChange: textFieldOnChange)));
  }

  void loginOnTap() {
    if (validate) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashBoard()));
    } else {
      setState(() {
        if(!passwordController.text.isValidPassword){
          errorText = "PLease enter correct Password (eg:- Test@123)";
        }else {
          errorText = "PLease enter your correct Mail";
        }
      });
    }
  }

  void textFieldOnChange(String? val) {
    setState(() {
      validate;
    });
  }

  bool get validate => (passwordController.text.isValidPassword &&
      emailIdController.text.isValidEmail);
}
