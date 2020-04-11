import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:workout_app/src/providers/home_provider.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: HomeProvider(),
      builder: (
        BuildContext context,
        HomeProvider provider,
        Widget child,
      ) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(
              blockSizeHorizontal(context) * 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/exercise/12.png',
                    width: blockSizeHorizontal(context) * 50,
                  ),
                ),
                SizedBox(
                  height: blockSizeHorizontal(context) * 5,
                ),
                Text(
                  'Workout App',
                  style: TextStyle(
                    color: textColorBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: blockSizeHorizontal(context) * 15,
                  ),
                ),
                SizedBox(
                  height: blockSizeHorizontal(context) * 7,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(
                    vertical: blockSizeHorizontal(context) * 5,
                    horizontal: blockSizeHorizontal(context) * 30,
                  ),
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: textColorWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: blockSizeHorizontal(context) * 10,
                    ),
                  ),
                  onPressed: () {
                    provider.navigateToSetsNumberView();
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/images/exercise/8.png',
                    width: blockSizeHorizontal(context) * 50,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              top: 0,
              right: blockSizeHorizontal(context) * 5,
              left: blockSizeHorizontal(context) * 5,
              bottom: blockSizeHorizontal(context) * 5,
            ),
            child: BottomAppBar(
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.info,
                      size: blockSizeHorizontal(context) * 10,
                    ),
                    onPressed: () {
                      provider.navigateToAboutCreatorView();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: blockSizeHorizontal(context) * 10,
                    ),
                    onPressed: () {
                      provider.navigateToSettingsView();
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
