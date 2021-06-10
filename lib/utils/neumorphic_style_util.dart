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
      intensity: 0.7,
      surfaceIntensity: 1,
      boxShape: boxShape ??
          NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? 0)),
      color: color ?? Get.theme.primaryColor,
      shadowDarkColor: shadowDarkColor ?? ColorUtil.DARK_SHADOW,
      shadowLightColor: shadowLightColor ?? ColorUtil.LIGHT_SHADOW,
      lightSource: lightSource,
      depth: 5,
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
        color: ColorUtil.GREY.withOpacity(0.1),
        width: 0.5,
        isEnabled: true,
      ),
      boxShape: boxShape ??
          NeumorphicBoxShape.roundRect(BorderRadius.circular(radius ?? 0)),
      color: color ?? Get.theme.primaryColor,
      shadowDarkColor: shadowDarkColor ?? ColorUtil.DARK_SHADOW,
      shadowLightColor: shadowLightColor ?? ColorUtil.LIGHT_SHADOW,
      depth: -5,
      intensity: 0.8,
      surfaceIntensity: 1,
      lightSource: lightSource,
    );
  }
}
