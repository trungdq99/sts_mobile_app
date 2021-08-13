/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:sts/utils/neumorphic_style_util.dart';

class ButtonCustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;
  final NeumorphicBoxShape boxShape;
  final LinearGradient gradient;
  final NeumorphicButtonClickListener onPressed;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool isUp;
  final bool styleOff;
  final Alignment alignment;
  final bool isDelay;

  const ButtonCustomWidget({
    this.width,
    this.height,
    this.radius: 20,
    this.color,
    this.boxShape,
    this.gradient,
    this.onPressed,
    this.child,
    this.padding: const EdgeInsets.all(10),
    this.margin: const EdgeInsets.all(20),
    this.isUp: true,
    this.styleOff: false,
    this.alignment: Alignment.center,
    this.isDelay: true,
  });

  @override
  Widget build(BuildContext context) {
    NeumorphicStyle style;
    if (styleOff)
      style = NeumorphicStyleUtil.styleOff(
        radius: radius,
        color: color,
        boxShape: boxShape,
      );
    else {
      if (isUp) {
        style = NeumorphicStyleUtil.styleUp(
          radius: radius,
          color: color,
          boxShape: boxShape,
        );
      } else {
        style = NeumorphicStyleUtil.styleDown(
          radius: radius,
          color: color,
          boxShape: boxShape,
        );
      }
    }
    return NeumorphicButton(
      style: style,
      padding: EdgeInsets.all(0),
      margin: margin,
      onPressed: onPressed != null
          ? () async {
              if (isDelay) await Future.delayed(Duration(milliseconds: 100));
              onPressed();
            }
          : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        padding: padding,
        alignment: alignment,
        child: child,
      ),
    );
  }
}
