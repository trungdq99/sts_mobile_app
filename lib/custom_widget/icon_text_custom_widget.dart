import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconTextCustomWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double iconSize;
  final double textSize;
  final double padding;
  final FontWeight fontWeight;
  const IconTextCustomWidget({
    @required this.icon,
    @required this.text,
    this.color,
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
        Icon(
          icon,
          size: iconSize,
          color: color ?? Get.theme.primaryColor,
        ),
        SizedBox(
          width: text.isNotEmpty ? padding : 0,
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: color ?? Get.theme.primaryColor,
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
