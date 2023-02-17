import 'package:e_cinemav1/authentification/services/authstate_provider.dart';
import 'package:e_cinemav1/consts/colors.dart';
import 'package:e_cinemav1/consts/widgets/elevatedbtn_widget.dart';
import 'package:e_cinemav1/consts/widgets/form_widgets/login_form_widget.dart';
import 'package:e_cinemav1/consts/widgets/form_widgets/register_form_widget.dart';
import 'package:e_cinemav1/consts/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterUI extends StatefulWidget {
  RegisterUI({Key? key}) : super(key: key);

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: Consumer<AuthStateProvider>(builder: (context, provider, child) {
        return SafeArea(
          child: Column(
            children: [
              TabBarWidget(provider: provider),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      child: provider.loginState == 0
                          ? LoginFormWidget(
                              formKey: formKey,
                              emailController: emailController,
                              passwordController: passwordController)
                          : RegisterFormWidget(
                              emailController: emailController,
                              formKey: formKey,
                              passwordController: passwordController,
                              phoneController: phoneController,
                              usernameController: usernameController,
                              confirmPasswordController:
                                  confirmPasswordController,
                            )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                      child: CustomElevatedButton(
                    onPressed: () {},
                    buttonText: provider.loginState == 0 ? "LOGIN" : "REGISTER",
                  )),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class TabBarWidget extends StatefulWidget {
  final AuthStateProvider provider;
  TabBarWidget({Key? key, required this.provider}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    var currentState = widget.provider.loginState;
    var provider = widget.provider;
    return Expanded(
      flex: 2,
      child: Container(
        color: backgroundColor.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "E-CINEMA",
              style: GoogleFonts.gluten(
                  fontSize: 33,
                  letterSpacing: 1.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.changeState(0);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: currentState == 0
                                    ? primaryOrangeColor
                                    : offColor,
                                width: 1.7))),
                    alignment: Alignment.center,
                    height: 70,
                    width: 200,
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.exo2(
                          fontSize: 20,
                          color:
                              currentState == 0 ? primaryOrangeColor : offColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    provider.changeState(1);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: currentState == 1
                                    ? primaryOrangeColor
                                    : offColor,
                                width: 1.7))),
                    height: 70,
                    width: 200,
                    child: Text(
                      "REGISTER",
                      style: GoogleFonts.exo2(
                          fontSize: 20,
                          color:
                              currentState == 1 ? primaryOrangeColor : offColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
