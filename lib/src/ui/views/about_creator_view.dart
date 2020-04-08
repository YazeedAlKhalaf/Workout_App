import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:workout_app/src/providers/about_creator_provider.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';

class AboutCreatorView extends StatefulWidget {
  @override
  _AboutCreatorViewState createState() => _AboutCreatorViewState();
}

class _AboutCreatorViewState extends State<AboutCreatorView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: AboutCreatorProvider(),
      builder: (
        BuildContext context,
        AboutCreatorProvider provider,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
          ),
          body: Center(
            child: Text(
              'About Creator',
              style: TextStyle(
                fontSize: screenWidth(context) * 0.1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
