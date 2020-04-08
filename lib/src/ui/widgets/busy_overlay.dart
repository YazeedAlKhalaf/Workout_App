import 'package:flutter/material.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';

/// A modal overlay that will show over your child widget (fullscreen) when the show value is true
///
/// Wrap your scaffold in this widget and set show value to model.isBusy to show a loading modal when
/// your model state is Busy
class BusyOverlay extends StatelessWidget {
  final Widget child;
  final String text;
  final bool show;

  const BusyOverlay({
    this.child,
    this.text = 'Please wait...',
    this.show = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          child ?? Container(),
          Opacity(
            opacity: show ? 0.7 : 0.0,
            child: Container(
              width: screenWidth(context),
              height: screenHeight(context),
              alignment: Alignment.center,
              color: backgroundColor,
            ),
          ),
          Opacity(
            opacity: show ? 1.0 : 0.0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: screenWidth(context) * 0.05,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: screenWidth(context) * 0.05,
                      fontWeight: FontWeight.bold,
                      color: textColorBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
