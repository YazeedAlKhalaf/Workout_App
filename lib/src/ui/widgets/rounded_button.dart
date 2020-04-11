import 'package:flutter/material.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color buttonColor;

  RoundedButton({
    @required this.text,
    @required this.onPressed,
    this.padding,
    @required this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.textColor = textColorWhite,
    this.buttonColor = primaryColor,
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: padding,
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
