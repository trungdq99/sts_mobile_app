import 'dart:ui';

class ColorUtil {
  static const WHITE = Color(0xfff2f2f2);
  static const BLUE = Color(0xff105cfa);
  static const BLUE1 = Color(0xff101afa);
  static const BLUE2 = Color(0xff4f84ba);
  static const BLUE3 = Color(0xff109ffa);

  static const RED = Color(0xffff174e);
  static const ORANGE = Color(0xffdc673c);
  // static const BLACK = Color(0xff2a1d1d);
  static const BLACK = Color.fromRGBO(112, 112, 112, 1);
  static const GREEN = Color(0xff00a806);
  static const YELLOW = Color(0xffffae00);
  static const GREY = Color(0xff707070);

  static const DARK_SHADOW = Color(0xff0d2750);
  static const LIGHT_SHADOW = Color(0xffffffff);

  static const GRADIENT_BLUE = [
    Color(0xff101afa),
    Color(0xff105cfa),
    Color(0xff109ffa),
  ];

  static const GRADIENT_RED = [
    RED,
    ORANGE,
    YELLOW,
  ];
  static const GRADIENT_GREEN = [
    GREEN,
    Color(0xff00c800),
    Color(0xff00f800),
  ];
}
