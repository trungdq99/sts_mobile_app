import 'package:flutter/material.dart';

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
    this.color: Colors.black,
    this.iconColor,
    this.iconSize: 20,
    this.textSize: 16,
    this.padding: 10,
    this.fontWeight: FontWeight.bold,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: iconSize,
          // color: iconColor ?? color,
        ),
        SizedBox(
          width: text.isNotEmpty ? padding : 0,
        ),
        Flexible(
          child: Text(
            text,
            // style: UtilTextStyle.defaultTextStyle(
            //   color: color,
            //   fontSize: textSize,
            //   fontWeight: fontWeight,
            // ),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
