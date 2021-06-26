/*
 * Author: Trung Shin
 */

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'color_util.dart';

class NeumorphicStyleUtil {
  static NeumorphicStyle styleUp({
    double radius,
    Color color,
    Color shadowDarkColor,
    Color shadowLightColor,
    NeumorphicBoxShape boxShape,
    LightSource lightSource: LightSource.topLeft,
  }) {
    return NeumorphicStyle(
      border: NeumorphicBorder(
        color: ColorUtil.GREY.withOpacity(0.1),
        width: 0.1,
        isEnabled: true,
      ),
      intensity: 0.5,
      depth: 8,
      boxShape: boxShape ??
          NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? 0)),
      color: color ?? Get.theme.primaryColor,
      shadowDarkColor: Get.theme.shadowColor,
      shadowLightColor: Get.theme.highlightColor,
      shadowLightColorEmboss: Get.theme.highlightColor,
      shadowDarkColorEmboss: Get.theme.shadowColor,
      lightSource: lightSource,
    );
  }

  static NeumorphicStyle styleDown({
    double radius,
    Color color,
    Color shadowDarkColor,
    Color shadowLightColor,
    NeumorphicBoxShape boxShape,
    LightSource lightSource: LightSource.topLeft,
  }) {
    return NeumorphicStyle(
      border: NeumorphicBorder(
        color: Get.theme.highlightColor,
        width: 0.1,
        isEnabled: true,
      ),
      boxShape: boxShape ??
          NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? 0)),
      color: color ?? Get.theme.primaryColor,
      shadowDarkColor: Get.theme.shadowColor,
      shadowLightColor: Get.theme.highlightColor,
      shadowLightColorEmboss: Get.theme.highlightColor,
      shadowDarkColorEmboss: Get.theme.shadowColor,
      depth: -8,
      intensity: 0.5,
      lightSource: lightSource,
    );
  }
}
