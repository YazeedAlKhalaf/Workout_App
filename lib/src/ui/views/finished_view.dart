import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:workout_app/src/providers/finished_provider.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';
import 'package:workout_app/src/ui/widgets/rounded_button.dart';

class FinishedView extends StatefulWidget {
  @override
  _FinishedViewState createState() => _FinishedViewState();
}

class _FinishedViewState extends State<FinishedView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: FinishedProvider(),
      builder: (
        BuildContext context,
        FinishedProvider provider,
        Widget child,
      ) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(
                blockSizeHorizontal(context) * 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hooray!!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: blockSizeHorizontal(context) * 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: blockSizeHorizontal(context) * 10,
                  ),
                  Text(
                    'You have finished your workout.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: blockSizeHorizontal(context) * 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: blockSizeHorizontal(context) * 10,
                  ),
                  Image.asset(
                    'assets/images/misc/banner1.png',
                  ),
                  SizedBox(
                    height: blockSizeHorizontal(context) * 40,
                  ),
                  RoundedButton(
                    text: 'Back To Home',
                    fontSize: blockSizeHorizontal(context) * 9,
                    padding: EdgeInsets.symmetric(
                      horizontal: blockSizeHorizontal(context) * 12,
                      vertical: blockSizeHorizontal(context) * 3,
                    ),
                    onPressed: () {
                      provider.navigateToHome();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
