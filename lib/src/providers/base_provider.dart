import 'package:flutter/cupertino.dart';
import 'package:workout_app/src/locator.dart';
import 'package:workout_app/src/services/dialog_service.dart';
import 'package:workout_app/src/services/navigation_service.dart';
import 'package:workout_app/src/services/sharedpreferences_service.dart';

class BaseProvider extends ChangeNotifier {
  final NavigationService navigationService = locator<NavigationService>();
  final DialogService dialogService = locator<DialogService>();
  final SharedPrefsService sharedPrefsService = locator<SharedPrefsService>();

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  String get mode => sharedPrefsService.mode;
  int get setsNumber => sharedPrefsService.setsNumber;
}
