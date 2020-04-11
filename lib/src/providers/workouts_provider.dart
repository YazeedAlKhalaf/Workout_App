import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:workout_app/src/constants/enums.dart';
import 'package:workout_app/src/constants/exercises_list.dart';
import 'package:workout_app/src/constants/route_names.dart';
import 'package:workout_app/src/models/exercise_model.dart';
import 'package:workout_app/src/providers/base_provider.dart';

class WorkoutsProvider extends BaseProvider {
  final PageController pageController = PageController();
  var currentPageValue = 0.0;

  bool timerFinished = false;

  List<Exercise> exercises = [];

  setCurrentPageValue() {
    currentPageValue = pageController.page;
    notifyListeners();
  }

  Exercise getRandomExercise(List list) {
    final random = Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  List<Exercise> chooseFiveRandomExercises() {
    List<Exercise> withoutChosenExercisesList = exercisesList;
    List<Exercise> listOfFive = [];
    for (int i = 0; i < 5; i++) {
      Exercise randomExercise = getRandomExercise(withoutChosenExercisesList);
      listOfFive.add(randomExercise);
      withoutChosenExercisesList.remove(randomExercise);
    }
    return listOfFive;
  }

  nextPage() {
    if (pageController.page.toInt() + 1 == exercises.length) {
      exercises = [];
      notifyListeners();
      navigationService.navigateToAndRemoveUntill(FinishedViewRoute);
    }
    pageController.animateToPage(
      pageController.page.toInt() + 1,
      duration: Duration(
        seconds: 2,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  initiate() {
    if (mode == modeToString(Mode.random)) {
      print(mode + " is the mode you chose!");
      print(setsNumber.toString() + " is the number of sets you chose!");

      exercises = chooseFiveRandomExercises();
      notifyListeners();
    } else if (mode == modeToString(Mode.dayWise)) {
      print(mode + " is the mode you chose!");
      print(setsNumber.toString() + " is the number of sets you chose!");

      switch (DateTime.now().day - 5) {
        case DateTime.sunday:
          print('sunday');
          exercises = exercisesSunday;
          break;
        case DateTime.monday:
          print('monday');
          exercises = exercisesMonday;
          break;
        case DateTime.tuesday:
          print('tuesday');
          exercises = exercisesTuesday;
          break;
        case DateTime.wednesday:
          print('wednesday');
          exercises = exercisesWednesday;
          break;
        case DateTime.thursday:
          print('thursday');
          exercises = exercisesThursday;
          break;
        case DateTime.friday:
          print('friday');
          exercises = exercisesFriday;
          break;
        case DateTime.saturday:
          print('saturday');
          exercises = exercisesSaturday;
          break;
        default:
          print('default');
          exercises = exercisesSunday;
          break;
      }
      notifyListeners();
    }
  }
}
