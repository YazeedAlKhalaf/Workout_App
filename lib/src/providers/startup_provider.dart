import 'dart:async';

import 'package:workout_app/src/constants/route_names.dart';
import 'package:workout_app/src/providers/base_provider.dart';

class StartupProvider extends BaseProvider {
  handleStartupLogic() async {
    await sharedPrefsService.getMode();
    bool didChooseMode = sharedPrefsService.mode == null ? false : true;
    if (didChooseMode) {
      Timer(
        Duration(
          seconds: 2,
        ),
        () => navigationService.navigateToAndRemoveUntill(
          HomeViewRoute,
        ),
      );
    } else {
      Timer(
        Duration(
          seconds: 2,
        ),
        () => navigationService.navigateToAndRemoveUntill(
          WelcomeViewRoute,
        ),
      );
    }
  }
}
