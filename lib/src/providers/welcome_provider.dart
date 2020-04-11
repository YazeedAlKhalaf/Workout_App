import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:workout_app/src/constants/route_names.dart';
import 'package:workout_app/src/providers/base_provider.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';

class WelcomeProvider extends BaseProvider {
  BuildContext context;
  List<Slide> slides;
  initiate({
    @required BuildContext contextFromFunc,
  }) {
    context = contextFromFunc;
    slides = [
      Slide(
        // TODO: change to image of random and daywise modes
        pathImage: 'assets/images/misc/welcome.png',
        title: 'Welcome',
        styleTitle: TextStyle(
          fontSize: blockSizeHorizontal(context) * 10,
          fontWeight: FontWeight.bold,
          color: textColorWhite,
        ),
        description:
            'We are happy to see new people doing exercises using our app! We hope you enjoy!',
        styleDescription: TextStyle(
          fontSize: blockSizeHorizontal(context) * 6,
          color: textColorWhite,
        ),
        backgroundColor: primaryColor,
      ),
      Slide(
        // TODO: change to image of daywise mode
        pathImage: 'assets/images/exercise/2.png',
        title: 'Random Mode',
        styleTitle: TextStyle(
          fontSize: blockSizeHorizontal(context) * 10,
          fontWeight: FontWeight.bold,
          color: textColorWhite,
        ),
        description:
            'The random mode uses a complex algorithm to choose 5 exercises that you might like! If you didn\'t like what was chosen, you can rerun the algorithm to choose another 5!',
        styleDescription: TextStyle(
          fontSize: blockSizeHorizontal(context) * 6,
          color: textColorWhite,
        ),
        backgroundColor: primaryColor,
      ),
      Slide(
        // TODO: change to image of random mode
        pathImage: 'assets/images/exercise/3.png',
        title: 'Day-Wise Mode',
        styleTitle: TextStyle(
          fontSize: blockSizeHorizontal(context) * 10,
          fontWeight: FontWeight.bold,
          color: textColorWhite,
        ),
        description:
            'The day-wise mode uses a fixed set of exercises that you can\'t change or play with! It\'s better for people who do like being on a schedule.',
        styleDescription: TextStyle(
          fontSize: blockSizeHorizontal(context) * 6,
          color: textColorWhite,
        ),
        backgroundColor: primaryColor,
      ),
    ];
    notifyListeners();
  }

  onDonePressed() {
    navigationService.navigateToAndRemoveUntill(
      SettingsViewRoute,
    );
  }
}
