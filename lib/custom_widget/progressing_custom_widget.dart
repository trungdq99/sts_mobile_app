import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

enum ProcessingType {
  circle,
  text,
}

class ProgressingCustomWidget extends StatelessWidget {
  final ProcessingType type;
  final Color color;
  const ProgressingCustomWidget({
    this.type: ProcessingType.circle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ProcessingType.circle:
        return SpinKitPouringHourglass(
          color: color ?? Get.theme.primaryColor,
          size: 40,
          duration: Duration(milliseconds: 600),
        );
      case ProcessingType.text:
        return PlaceholderLines(
          count: 1,
          color: color ?? Get.theme.primaryColor,
          animate: true,
          align: TextAlign.left,
        );
      default:
        return NeumorphicProgressIndeterminate(
          duration: Duration(milliseconds: 1000),
          style: ProgressStyle(
            lightSource: LightSource.topLeft,
            depth: 20,
            border: NeumorphicBorder(width: 0.8),
            accent: Get.theme.accentColor,
            gradientBorderRadius: BorderRadius.circular(50),
            borderRadius: BorderRadius.circular(50),
            variant: Get.theme.primaryColor,
          ),
        );
    }
  }
}
