import 'package:workout_app/src/constants/route_names.dart';
import 'package:workout_app/src/providers/base_provider.dart';

class HomeProvider extends BaseProvider {
  navigateToSetsNumberView() {
    navigationService.navigateTo(
      SetsNumberViewRoute,
    );
  }

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
