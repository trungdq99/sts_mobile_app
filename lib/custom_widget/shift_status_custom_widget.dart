/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/utils/color_util.dart';
import 'container_custom_widget.dart';

class ShiftStatusCustomWidget extends StatelessWidget {
  final String status;
  const ShiftStatusCustomWidget({@required this.status});

  @override
  Widget build(BuildContext context) {
    Color color = ColorUtil.PRIMARY_LIGHT;
    switch (status) {
      case 'Vắng mặt':
        color = ColorUtil.RED;
        break;
      case 'Có mặt':
        color = ColorUtil.GREEN;
        break;
      case 'Sắp tới':
        color = ColorUtil.GREY;
        break;
      default:
        break;
    }
    return ContainerCustomWidget(
      color: ColorUtil.WHITE,
      radius: 5,
      padding: EdgeInsets.all(5),
      child: Text(
        status,
        style: Get.textTheme.bodyText2.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
