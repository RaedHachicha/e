import 'package:e_cinemav1/consts/widgets/animated_logo.dart';
import 'package:e_cinemav1/consts/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../elevatedbtn_widget.dart';

class LoginFormWidget extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginFormWidget(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final formKey = GlobalKey<FormState>();

  SignIn() {
    final form = formKey.currentState;
    if (form!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    var emailValidator = ValidationBuilder().required().email().build();
    var passwordValidator =
        ValidationBuilder().required().minLength(8).maxLength(20).build();
    return Scaffold(
        body: Form(
      key: formKey,
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
                  CustomElevatedButton(onPressed: SignIn, buttonText: "LOGIN")),
        ],
      ),
    ));
  }
}
