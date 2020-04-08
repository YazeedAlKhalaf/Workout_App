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
              screenWidth(context) * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/12.png',
                    width: screenWidth(context) * 0.6,
                  ),
                ),
                SizedBox(
                  height: screenWidth(context) * 0.05,
                ),
                Text(
                  'Workout App',
                  style: TextStyle(
                    color: textColorBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth(context) * 0.15,
                  ),
                ),
                SizedBox(
                  height: screenWidth(context) * 0.1,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth(context) * 0.05,
                    horizontal: screenWidth(context) * 0.3,
                  ),
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      screenWidth(context),
                    ),
                  ),
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: textColorWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth(context) * 0.1,
                    ),
                  ),
                  onPressed: () {},
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/8.png',
                    width: screenWidth(context) * 0.6,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              top: 0,
              right: screenWidth(context) * 0.04,
              left: screenWidth(context) * 0.04,
              bottom: screenWidth(context) * 0.03,
            ),
            child: BottomAppBar(
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.info,
                      size: screenWidth(context) * 0.1,
                    ),
                    onPressed: () {
                      provider.navigateToAboutCreatorView();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: screenWidth(context) * 0.1,
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
