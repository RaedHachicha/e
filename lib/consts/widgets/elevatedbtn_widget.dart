import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class CustomElevatedButton extends StatefulWidget {
  final String buttonText;
  final Function()? onPressed;

  CustomElevatedButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: primaryOrangeColor),
      onPressed: widget.onPressed,
      child: Text(
        widget.buttonText,
        style: GoogleFonts.exo2(
          letterSpacing: 1.5,
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
