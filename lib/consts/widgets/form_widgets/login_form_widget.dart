import 'package:e_cinemav1/consts/widgets/animated_logo.dart';
import 'package:e_cinemav1/consts/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:e_cinemav1/authentification/model/user_model.dart';
import 'package:e_cinemav1/authentification/services/sqflite_service.dart';

import '../comAlert.dart';
import '../elevatedbtn_widget.dart';
import 'Home.dart';

class LoginFormWidget extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormWidget(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  login() async {
    String email = widget.emailController.text;
    String password = widget.passwordController.text;

    if (email.isEmpty) {
      alertDialog("Please Enter User Email");
    } else if (password.isEmpty) {
      alertDialog("Please Enter Password");
    } else {
      await DatabaseService.service
          .getLoginUser(email, password)
          .then((userData) {
        if (userData != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => HomeForm()),
              (Route<dynamic> route) => false);
        } else {
          alertDialog(" User Not Found");
        }
      }).catchError((error) {
        print(error);
        alertDialog("Error: Login Fail");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var emailValidator = ValidationBuilder().required().email().build();
    var passwordValidator =
        ValidationBuilder().required().minLength(8).maxLength(20).build();
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const AnimatedLogo(),
          CustomTextField(
              isPassword: false,
              hintText: "Email",
              validator: emailValidator,
              fieldController: widget.emailController),
          CustomTextField(
              isPassword: true,
              hintText: "Password",
              validator: passwordValidator,
              fieldController: widget.passwordController),
          SizedBox(
              width: double.infinity,
              child:
                  CustomElevatedButton(onPressed: login, buttonText: "LOGIN")),
        ],
      ),
    )));
  }
}
