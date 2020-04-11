import 'package:flutter/material.dart';
import 'package:workout_app/src/constants/route_names.dart';
import 'package:workout_app/src/ui/views/about_creator_view.dart';
import 'package:workout_app/src/ui/views/finished_view.dart';
import 'package:workout_app/src/ui/views/home_view.dart';
import 'package:workout_app/src/ui/views/sets_number_view.dart';
import 'package:workout_app/src/ui/views/settings_view.dart';
import 'package:workout_app/src/ui/views/welcome_view.dart';
import 'package:workout_app/src/ui/views/workout_view.dart';
import 'package:workout_app/src/ui/views/workouts_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case AboutCreatorViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: AboutCreatorView(),
      );
    case SettingsViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SettingsView(),
      );
      break;
    case SetsNumberViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SetsNumberView(),
      );
      break;
    case WorkoutViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: WorkoutView(),
      );
      break;
    case WorkoutsViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: WorkoutsView(),
      );
      break;
    case WelcomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: WelcomeView(),
      );
    case FinishedViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: FinishedView(),
      );
      break;
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({
  String routeName,
  Widget viewToShow,
}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
