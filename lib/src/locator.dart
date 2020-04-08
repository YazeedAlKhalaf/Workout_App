import 'package:get_it/get_it.dart';
import 'package:workout_app/src/services/dialog_service.dart';
import 'package:workout_app/src/services/navigation_service.dart';
import 'package:workout_app/src/services/sharedpreferences_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SharedPrefsService());
}
