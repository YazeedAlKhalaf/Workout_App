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
