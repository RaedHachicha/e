import 'package:e_cinemav1/authentification/model/user_model.dart';
import 'package:e_cinemav1/authentification/services/sqflite_service.dart';
import 'package:e_cinemav1/authentification/view/register_view.dart';
import 'package:e_cinemav1/consts/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../comAlert.dart';
import '../elevatedbtn_widget.dart';

class RegisterFormWidget extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterFormWidget(
      {Key? key,
      required this.usernameController,
      required this.phoneController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController})
      : super(key: key);

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final usernameValidator =
      ValidationBuilder().required().minLength(3).maxLength(10).build();
  final phoneValidator = ValidationBuilder().required().phone().build();
  final emailValidator = ValidationBuilder().required().email().build();
  final passwordValidator =
      ValidationBuilder().required().minLength(8).maxLength(20).build();
  final confirmPasswordValidator =
      ValidationBuilder().required().minLength(8).maxLength(20).build();

  SignUp() {
    String password = widget.passwordController.text;
    String cpassword = widget.confirmPasswordController.text;

    if (_formKey.currentState!.validate()) {
      if (password != cpassword) {
        alertDialog('Password Mismatch');
      } else {
        _formKey.currentState!.save();
        User user = User(
            username: widget.usernameController.text,
            phonenumber: widget.phoneController.text,
            email: widget.emailController.text,
            password: widget.passwordController.text);

        DatabaseService.service.saveData(user).then((userData) {
          alertDialog("Successfully Saved");

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => RegisterUI()),
              (Route<dynamic> route) => false);
        }).catchError((error) {
          print(error);
          alertDialog("Error: Data Save Fail");
        });
      }
    } else {
      alertDialog("Not Valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextField(
              isPassword: false,
              hintText: "Username",
              validator: usernameValidator,
              fieldController: widget.usernameController),
          CustomTextField(
              isPassword: false,
              hintText: "Phone Number (+33)",
              validator: phoneValidator,
              fieldController: widget.phoneController),
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
          CustomTextField(
              isPassword: true,
              hintText: "Confirm Password",
              validator: confirmPasswordValidator,
              fieldController: widget.confirmPasswordController),
          SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                onPressed: SignUp,
                buttonText: "REGISTER",
              )),
        ],
      ),
    )));
  }
}
