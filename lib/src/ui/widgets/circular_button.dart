import 'package:flutter/material.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';

class CircularButton extends StatelessWidget {
  final Widget child;
  final double radius;
  final VoidCallback onTap;

  CircularButton({
    @required this.child,
    @required this.radius,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipOval(
        child: Material(
          color: primaryColor,
          child: SizedBox(
            width: radius,
            height: radius,
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
