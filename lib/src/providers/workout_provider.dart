import 'package:workout_app/src/constants/route_names.dart';
import 'package:workout_app/src/models/dialog_models.dart';
import 'package:workout_app/src/providers/base_provider.dart';

class WorkoutProvider extends BaseProvider {
  navigateToHome() async {
    setBusy(true);
    DialogResponse response = await dialogService.showConfirmationDialog(
      title: 'Oops!',
      description: 'Are you sure you wanna cancel?',
      cancelTitle: 'Nope',
      confirmationTitle: 'Yes, Pretty Sure!',
    );
    if (response.confirmed) {
      await navigationService.navigateToAndRemoveUntill(HomeViewRoute);
    }
  }
}
