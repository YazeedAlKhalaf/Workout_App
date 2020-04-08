import 'package:workout_app/constants/enums.dart';
import 'package:workout_app/constants/keys.dart';
import 'package:workout_app/constants/route_names.dart';
import 'package:workout_app/src/providers/base_provider.dart';

class SettingsProvider extends BaseProvider {
  setMode(Modes mode) async {
    String modeToSave = mode == Modes.random ? 'random' : 'day_wise';
    setBusy(true);
    await sharedPrefsService.saveValue(
      modeKey,
      modeToSave,
    );
    navigationService.navigateToAndRemoveUntill(HomeViewRoute);
    setBusy(false);
  }
}
