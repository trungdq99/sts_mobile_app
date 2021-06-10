import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:sts/utils/color_util.dart';

class GradientCustomWidget extends StatelessWidget {
  const GradientCustomWidget({
    this.size: 18,
    this.gradient: ColorUtil.GRADIENT_BLUE,
    @required this.child,
  });

  final double size;
  final List<Color> gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return ui.Gradient.linear(
          Offset(0, 0),
          Offset(0, size),
          gradient,
          [
            0,
            0.4,
            0.8,
          ],
        );
      },
      child: child,
    );
  }
}
