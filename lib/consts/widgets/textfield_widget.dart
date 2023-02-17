import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController fieldController;
  final String hintText;
  final String? Function(String?)? validator;
  CustomTextField({Key? key, required this.hintText, required this.validator, required this.fieldController})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    String hint = widget.hintText;
    return TextFormField(
      style: TextStyle(
        color: Colors.white
      ),
      controller: widget.fieldController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.8), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
        hintStyle: TextStyle(
          color: Colors.white
        ),
        hintText: hint,
      ),
      validator: widget.validator,
    );
  }
}
