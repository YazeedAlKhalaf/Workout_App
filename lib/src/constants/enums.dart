enum Mode {
  random,
  dayWise,
}

modeToString(Mode mode) {
  switch (mode) {
    case Mode.random:
      return "random";
      break;
    case Mode.dayWise:
      return "dayWise";
      break;
  }
}

enum EType {
  exerciseType,
  breakType,
}

eTypeToString(EType eType) {
  switch (eType) {
    case EType.exerciseType:
      return "exercise";
      break;
    case EType.breakType:
      return "break";
      break;
  }
}
