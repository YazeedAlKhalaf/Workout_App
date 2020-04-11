import 'package:flutter/cupertino.dart';
import 'package:workout_app/src/constants/route_names.dart';
import 'package:workout_app/src/providers/base_provider.dart';

class SetsNumberProvider extends BaseProvider {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController setsNumberController = TextEditingController();

  save() async {
    setsNumber.toString();
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setBusy(true);
      await sharedPrefsService.saveSetsNumber(
        int.parse(setsNumberController.text),
      );
      print(sharedPrefsService.setsNumber);
      await navigationService.navigateToAndRemoveUntill(WorkoutsViewRoute);
      setBusy(false);
    }
  }
}
