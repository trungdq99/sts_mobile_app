import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';

class BackButtonCustomWidget extends StatelessWidget {
  final bool isFullscreenDialog;
  const BackButtonCustomWidget({
    this.isFullscreenDialog: false,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonCustomWidget(
      onPressed: () {
        Get.back();
      },
      color: Get.theme.primaryColor,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      boxShape: NeumorphicBoxShape.circle(),
      child: Icon(
        isFullscreenDialog
            ? FontAwesomeIcons.times
            : FontAwesomeIcons.chevronLeft,
        color: Get.theme.backgroundColor,
        size: 20,
      ),
    );
  }
}
