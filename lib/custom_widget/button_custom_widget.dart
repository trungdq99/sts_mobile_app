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
  final Alignment alignment;

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
    this.alignment: Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: isUp
          ? NeumorphicStyleUtil.styleUp(
              radius: radius,
              color: color ?? Get.theme.buttonColor,
              boxShape: boxShape,
            )
          : NeumorphicStyleUtil.styleDown(
              radius: radius,
              color: color ?? Get.theme.buttonColor,
              boxShape: boxShape,
            ),
      padding: EdgeInsets.all(0),
      margin: margin,
      onPressed: onPressed != null
          ? () async {
              await Future.delayed(Duration(milliseconds: 100));
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
