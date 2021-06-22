import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';

class CircleAvatarCustomWidget extends StatelessWidget {
  final double size;
  final Color color;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool isUp;
  const CircleAvatarCustomWidget({
    this.size,
    this.color,
    this.child,
    this.padding,
    this.margin,
    this.isUp: true,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerCustomWidget(
      boxShape: NeumorphicBoxShape.circle(),
      padding: padding ?? EdgeInsets.all(5),
      margin: margin ?? EdgeInsets.all(0),
      width: size,
      height: size,
      color: color,
      isUp: isUp,
      child: child,
    );
  }
}
