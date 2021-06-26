/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';

import 'button_custom_widget.dart';

class AppBarCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget title;
  final bool showBackButton;
  final bool isFullscreenDialog;
  final bool showCheckButton;
  final NeumorphicButtonClickListener onCheckButtonPressed;
  final NeumorphicButtonClickListener onBackButtonPressed;

  const AppBarCustomWidget({
    this.title,
    this.showBackButton: false,
    this.isFullscreenDialog: false,
    this.showCheckButton: false,
    this.onCheckButtonPressed,
    this.onBackButtonPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ContainerCustomWidget(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      radius: 5,
      margin: EdgeInsets.all(0),
      child: SafeArea(
        child: Row(
          children: [
            showBackButton
                ? _buildBackButton()
                : SizedBox(
                    height: 40,
                    width: 40,
                  ),
            Expanded(child: Center(child: title)),
            showCheckButton
                ? _buildCheckButton()
                : SizedBox(
                    height: 40,
                    width: 40,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return ButtonCustomWidget(
      onPressed: () {
        if (onBackButtonPressed != null) onBackButtonPressed();
        Get.back();
      },
      height: 40,
      width: 40,
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

  Widget _buildCheckButton() {
    return ButtonCustomWidget(
      onPressed: onCheckButtonPressed,
      height: 40,
      width: 40,
      color: Get.theme.primaryColor,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      boxShape: NeumorphicBoxShape.circle(),
      child: Icon(
        FontAwesomeIcons.check,
        color: Get.theme.backgroundColor,
        size: 20,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
