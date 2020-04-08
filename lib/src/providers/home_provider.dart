import 'package:workout_app/constants/route_names.dart';
import 'package:workout_app/src/providers/base_provider.dart';

class HomeProvider extends BaseProvider {
  navigateToAboutCreatorView() {
    navigationService.navigateTo(
      AboutCreatorViewRoute,
    );
  }

  navigateToSettingsView() {
    navigationService.navigateTo(
      SettingsViewRoute,
    );
  }
}
