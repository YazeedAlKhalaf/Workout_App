import 'package:workout_app/constants/keys.dart';
import 'package:workout_app/constants/route_names.dart';
import 'package:workout_app/src/providers/base_provider.dart';

class StartupProvider extends BaseProvider {
  handleStartupLogic() async {
    bool didChooseMode =
        await sharedPrefsService.getValue(modeKey) == null ? false : true;
    if (didChooseMode) {
      navigationService.navigateToAndRemoveUntill(HomeViewRoute);
    } else {
      navigationService.navigateToAndRemoveUntill(SettingsViewRoute);
    }
  }
}
