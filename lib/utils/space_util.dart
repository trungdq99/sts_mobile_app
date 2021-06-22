import 'package:flutter/widgets.dart';

class SpaceUtil {
  static const double SPACE_DEFAULT = 20;
  static const double SPACE_SMALL = 10;
  static const double SPACE_BIG = 40;

  static Widget verticalDefault() {
    return SizedBox(
      height: SPACE_DEFAULT,
    );
  }

  static Widget verticalSmall() {
    return SizedBox(
      height: SPACE_SMALL,
    );
  }

  static Widget verticalBig() {
    return SizedBox(
      height: SPACE_BIG,
    );
  }

  static Widget horizontalDefault() {
    return SizedBox(
      width: SPACE_DEFAULT,
    );
  }

  static Widget horizontalSmall() {
    return SizedBox(
      width: SPACE_SMALL,
    );
  }

  static Widget horizontalBig() {
    return SizedBox(
      width: SPACE_BIG,
    );
  }
}
