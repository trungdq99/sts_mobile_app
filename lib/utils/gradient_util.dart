/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'color_util.dart';

class GradientUtil {
  static List<double> stops = [
    0,
    0.4,
    0.8,
  ];

  static List<Color> defaultColor = ColorUtil.GRADIENT_BLUE;

  static LinearGradient topBottom({
    List<Color> colors,
  }) {
    return LinearGradient(
      colors: colors ?? defaultColor,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: stops,
    );
  }

  static LinearGradient bottomTop({
    List<Color> colors,
  }) {
    return LinearGradient(
      colors: colors ?? defaultColor,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: stops,
    );
  }

  static LinearGradient rightLeft({
    List<Color> colors,
  }) {
    return LinearGradient(
      colors: colors ?? defaultColor,
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      stops: stops,
    );
  }

  static LinearGradient leftRight({
    List<Color> colors,
  }) {
    return LinearGradient(
      colors: colors ?? defaultColor,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: stops,
    );
  }
}
