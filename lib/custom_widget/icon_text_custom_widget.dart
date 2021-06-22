import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/circle_avatar_custom_widget.dart';
import 'package:sts/utils/color_util.dart';

class IconTextCustomWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
  final double iconSize;
  final double textSize;
  final double padding;
  final FontWeight fontWeight;
  const IconTextCustomWidget({
    @required this.icon,
    @required this.text,
    this.color,
    this.iconColor,
    this.iconSize: 20,
    this.textSize: 16,
    this.padding: 10,
    this.fontWeight: FontWeight.normal,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatarCustomWidget(
          padding: EdgeInsets.all(5),
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor ?? Get.theme.primaryColor,
          ),
        ),
        SizedBox(
          width: text.isNotEmpty ? padding : 0,
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              // color: color ?? Get.theme.primaryColor,
              color: color ?? ColorUtil.BLACK,
              fontSize: textSize,
              fontWeight: fontWeight,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
