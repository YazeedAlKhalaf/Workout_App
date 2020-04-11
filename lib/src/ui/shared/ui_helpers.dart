import 'package:flutter/material.dart';
import 'package:workout_app/src/ui/shared/size_config.dart';

double screenWidth(BuildContext context) {
  SizeConfig().init(context);
  return SizeConfig.screenWidth;
}

double screenHeight(BuildContext context) {
  SizeConfig().init(context);
  return SizeConfig.screenHeight;
}

double blockSizeHorizontal(BuildContext context) {
  SizeConfig().init(context);
  return SizeConfig.blockSizeHorizontal;
}

double blockSizeVertical(BuildContext context) {
  SizeConfig().init(context);
  return SizeConfig.blockSizeVertical;
}
