import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController fieldController;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  const CustomTextField(
      {Key? key,
      required this.isPassword,
      required this.hintText,
      required this.validator,
      required this.fieldController})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    String hint = widget.hintText;
    return TextFormField(
      obscureText: widget.isPassword,
      style: const TextStyle(color: Colors.white),
      controller: widget.fieldController,
      onSaved: (newValue) => widget.fieldController.text = newValue!,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide:
              BorderSide(color: Colors.white.withOpacity(0.8), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
        hintStyle: const TextStyle(color: Colors.white),
        hintText: hint,
      ),
      validator: widget.validator,
    );
  }
}
