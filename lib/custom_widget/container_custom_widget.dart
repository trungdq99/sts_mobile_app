/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:sts/utils/neumorphic_style_util.dart';

class ContainerCustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;
  final NeumorphicBoxShape boxShape;
  final LinearGradient gradient;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Alignment alignment;
  final bool isUp;
  const ContainerCustomWidget({
    this.width,
    this.height,
    this.radius: 20,
    this.color,
    this.boxShape,
    this.gradient,
    this.child,
    this.padding,
    this.margin,
    this.alignment,
    this.isUp: true,
  });

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: isUp
          ? NeumorphicStyleUtil.styleUp(
              radius: radius,
              color: color ?? Get.theme.backgroundColor,
              boxShape: boxShape,
            )
          : NeumorphicStyleUtil.styleDown(
              radius: radius,
              color: color ?? Get.theme.backgroundColor,
              boxShape: boxShape,
            ),
      padding: EdgeInsets.all(0),
      margin: margin ?? EdgeInsets.all(20),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        padding: padding ?? EdgeInsets.all(10),
        alignment: alignment,
        child: child,
      ),
    );
  }
}
