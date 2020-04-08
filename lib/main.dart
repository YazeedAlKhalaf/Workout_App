import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_app/managers/dialog_manager.dart';
import 'package:workout_app/src/locator.dart';
import 'package:workout_app/src/services/dialog_service.dart';
import 'package:workout_app/src/services/navigation_service.dart';
import 'package:workout_app/src/ui/router.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/views/startup_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);

  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout App',
      builder: (BuildContext context, Widget child) {
        return Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return DialogManager(
                  child: child,
                );
              },
            );
          },
        );
      },
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      home: StartupView(),
      onGenerateRoute: generateRoute,
    );
  }
}
