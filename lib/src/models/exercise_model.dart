import 'package:workout_app/src/constants/enums.dart';

class Exercise {
  final String id;
  final String name;
  final String image;
  final Duration duration;
  final EType type;

  Exercise({
    this.id,
    this.name,
    this.image,
    this.duration,
    this.type = EType.exerciseType,
  });
}
