import 'package:e_cinemav1/consts/widgets/animated_logo.dart';
import 'package:e_cinemav1/consts/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class LoginFormWidget extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  LoginFormWidget(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  @override
  Widget build(BuildContext context) {
    var emailValidator = ValidationBuilder().required().email().build();
    var passwordValidator =
        ValidationBuilder().required().minLength(8).maxLength(20).build();
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedLogo(),
          CustomTextField(
              hintText: "Email",
              validator: emailValidator,
              fieldController: widget.emailController),
          CustomTextField(
              hintText: "Password",
              validator: passwordValidator,
              fieldController: widget.passwordController),
            SizedBox(height: 20,)
        ],
      ),
    );
  }
}
