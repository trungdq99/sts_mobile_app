/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/circle_avatar_custom_widget.dart';
import 'package:sts/utils/space_util.dart';

class IconTextCustomWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color backgroundIconColor;
  final double iconSize;
  final TextStyle textStyle;
  final EdgeInsets padding;

  const IconTextCustomWidget({
    @required this.icon,
    @required this.text,
    this.iconColor,
    this.backgroundIconColor,
    this.iconSize,
    this.padding,
    this.textStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatarCustomWidget(
          padding: padding,
          color: backgroundIconColor,
          child: Icon(
            icon,
            color: iconColor ?? Get.theme.primaryColor,
          ),
        ),
        SpaceUtil.horizontalSmall(),
        Flexible(
          child: Text(
            text,
            style: textStyle ?? Get.textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
