import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:workout_app/src/providers/startup_provider.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';

class StartupView extends StatefulWidget {
  @override
  _StartupViewState createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: StartupProvider(),
      onModelReady: (StartupProvider provider) {
        provider.handleStartupLogic();
      },
      builder: (
        BuildContext context,
        StartupProvider provider,
        Widget child,
      ) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/misc/logo_transparent.png',
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
