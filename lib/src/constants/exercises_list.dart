import 'package:workout_app/src/models/exercise_model.dart';

import 'enums.dart';

// TODO: make the exercises more realistic!

final exercisesList = [
  Exercise(
    id: "1",
    name: "Push Ups",
    image: 'assets/images/exercise/1.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "2",
    name: "Push Ups",
    image: 'assets/images/exercise/2.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "3",
    name: "Push Ups",
    image: 'assets/images/exercise/3.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "4",
    name: "Push Ups",
    image: 'assets/images/exercise/4.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "5",
    name: "V Crunch",
    image: 'assets/images/exercise/5.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "6",
    name: "Push Ups",
    image: 'assets/images/exercise/6.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "7",
    name: "Push Ups",
    image: 'assets/images/exercise/7.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "8",
    name: "Ab Tuck",
    image: 'assets/images/exercise/8.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "9",
    name: "Push Ups",
    image: 'assets/images/exercise/9.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "10",
    name: "Push Ups",
    image: 'assets/images/exercise/10.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "11",
    name: "Push Ups",
    image: 'assets/images/exercise/11.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "12",
    name: "Push Ups",
    image: 'assets/images/exercise/12.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "13",
    name: "Push Ups",
    image: 'assets/images/exercise/13.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
  Exercise(
    id: "14",
    name: "Incline Sit Ups",
    image: 'assets/images/exercise/14.png',
    duration: Duration(
      seconds: 5,
    ),
  ),
];

final Exercise breakExercise = Exercise(
  id: "break",
  name: "BREAK",
  image: 'assets/images/misc/welcome.png',
  duration: Duration(
    seconds: 40,
  ),
  type: EType.breakType,
);

final exercisesSunday = [
  exercisesList[0],
  breakExercise,
  exercisesList[5],
  breakExercise,
  exercisesList[10],
  breakExercise,
  exercisesList[8],
  breakExercise,
  exercisesList[13],
];

final exercisesMonday = [
  exercisesList[5],
  breakExercise,
  exercisesList[9],
  breakExercise,
  exercisesList[0],
  breakExercise,
  exercisesList[6],
  breakExercise,
  exercisesList[3],
];

final exercisesTuesday = [
  exercisesList[6],
  breakExercise,
  exercisesList[5],
  breakExercise,
  exercisesList[8],
  breakExercise,
  exercisesList[11],
  breakExercise,
  exercisesList[12],
];

final exercisesWednesday = [
  exercisesList[4],
  breakExercise,
  exercisesList[0],
  breakExercise,
  exercisesList[6],
  breakExercise,
  exercisesList[8],
  breakExercise,
  exercisesList[10],
];

final exercisesThursday = [
  exercisesList[9],
  breakExercise,
  exercisesList[8],
  breakExercise,
  exercisesList[6],
  breakExercise,
  exercisesList[3],
  breakExercise,
  exercisesList[0],
];

final exercisesFriday = [
  exercisesList[6],
  breakExercise,
  exercisesList[0],
  breakExercise,
  exercisesList[8],
  breakExercise,
  exercisesList[4],
  breakExercise,
  exercisesList[11],
];

final exercisesSaturday = [
  exercisesList[9],
  breakExercise,
  exercisesList[8],
  breakExercise,
  exercisesList[7],
  breakExercise,
  exercisesList[13],
  breakExercise,
  exercisesList[5],
];
