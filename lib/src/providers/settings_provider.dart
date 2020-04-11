import 'package:workout_app/src/constants/enums.dart';
import 'package:workout_app/src/constants/route_names.dart';
import 'package:workout_app/src/providers/base_provider.dart';

class SettingsProvider extends BaseProvider {
  saveMode(Mode mode) async {
    setBusy(true);
    await sharedPrefsService.saveMode(mode);
    navigationService.navigateToAndRemoveUntill(HomeViewRoute);
    setBusy(false);
  }
}
