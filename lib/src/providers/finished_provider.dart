import 'package:workout_app/src/constants/route_names.dart';
import 'package:workout_app/src/providers/base_provider.dart';

class FinishedProvider extends BaseProvider {
  navigateToHome() {
    navigationService.navigateToAndRemoveUntill(HomeViewRoute);
  }
}
