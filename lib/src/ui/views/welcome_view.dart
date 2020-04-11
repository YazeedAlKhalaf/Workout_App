import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:workout_app/src/providers/welcome_provider.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: WelcomeProvider(),
      onModelReady: (WelcomeProvider provider) {
        provider.initiate(
          contextFromFunc: context,
        );
      },
      builder: (
        BuildContext context,
        WelcomeProvider provider,
        Widget child,
      ) {
        return Scaffold(
          body: Center(
            child: IntroSlider(
              slides: provider.slides,
              colorActiveDot: textColorWhite,
              onDonePress: () {
                provider.onDonePressed();
              },
              styleNameSkipBtn: TextStyle(
                fontSize: blockSizeHorizontal(context) * 5,
                fontWeight: FontWeight.bold,
                color: textColorWhite,
              ),
              styleNameDoneBtn: TextStyle(
                fontSize: blockSizeHorizontal(context) * 5,
                fontWeight: FontWeight.bold,
                color: textColorWhite,
              ),
            ),
          ),
        );
      },
    );
  }
}
