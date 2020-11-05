import 'package:flutter/cupertino.dart';

import 'colors.dart';

class Typograph {
  static final TextStyle tabBarTitle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "robotoBlack",
      color: ColorsPalette.tealDark);
static final TextStyle semiTitle = TextStyle(
    fontFamily: "Adobe_Song",
    color: ColorsPalette.blackDark,
    fontWeight: FontWeight.bold,
    fontSize: 18
);

  static final Color tabBarIconColor =  ColorsPalette.tealDark.withOpacity(0.5);
}
