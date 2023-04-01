import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class CustomElevatedButton extends StatefulWidget {
  final String buttonText;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;

<<<<<<< HEAD
  CustomElevatedButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.width,
      this.fontSize,
      this.height})
=======
  const CustomElevatedButton(
      {Key? key, required this.buttonText, required this.onPressed})
>>>>>>> 2bce6c3b09770a5bd81b7233bd07b1348f8de529
      : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Container(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: primaryOrangeColor),
        onPressed: widget.onPressed,
        child: Text(
          widget.buttonText,
          style: GoogleFonts.exo2(
              letterSpacing: 1.5,
              color: Colors.white,
              fontSize: widget.fontSize,
              fontWeight: FontWeight.w600),
        ),
=======
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: primaryOrangeColor),
      onPressed: widget.onPressed,
      child: Text(
        widget.buttonText,
        style: GoogleFonts.exo2(
            letterSpacing: 1.5,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600),
>>>>>>> 2bce6c3b09770a5bd81b7233bd07b1348f8de529
      ),
    );
  }
}
