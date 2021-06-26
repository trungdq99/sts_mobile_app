/*
 * Author: Trung Shin
 */

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/space_util.dart';

class TimeSheetPage extends StatelessWidget {
  const TimeSheetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: Text(
          'Giờ công',
          style: Get.textTheme.headline6,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconTextCustomWidget(
              icon: FontAwesomeIcons.calendar,
              text: '7 Jun - 13 Jun',
              textStyle: Get.textTheme.button,
            ),
            SpaceUtil.verticalSmall(),
            _buildTimeSheet(),
            _buildTimeSheet(),
            _buildTotal(),
            IconTextCustomWidget(
              icon: FontAwesomeIcons.calendar,
              text: '14 Jun - 20 Jun',
              textStyle: Get.textTheme.button,
            ),
            SpaceUtil.verticalSmall(),
            _buildTimeSheet(),
            _buildTotal(),
          ],
        ),
      ),
    );
  }

  Widget _buildTotal() {
    return ContainerCustomWidget(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      color: ColorUtil.BLUE2,
      radius: 10,
      child: IconTextCustomWidget(
        icon: FontAwesomeIcons.solidClock,
        text: 'Tổng tuần: 8 giờ 20 phút',
        iconColor: ColorUtil.BLUE1,
        textStyle: Get.textTheme.button,
      ),
    );
  }

  Widget _buildTimeSheet() {
    return ButtonCustomWidget(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      radius: 10,
      alignment: Alignment.centerLeft,
      onPressed: () {
        // Get.toNamed(
        //   RouteUtil.SHIFT_DETAIL,
        //   arguments: 'Sắp tới',
        // );
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '13 Jun 2021',
                  style: Get.textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.solidHourglass,
                  text: '13:55 - 18:56',
                  iconColor: ColorUtil.BLUE1,
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.mapMarkerAlt,
                  text: 'Passio Coffee FPTU',
                  iconColor: ColorUtil.BLUE2,
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.tag,
                  text: 'Pha chế',
                  iconColor: ColorUtil.BLUE3,
                ),
              ],
            ),
          ),
          Icon(
            FontAwesomeIcons.chevronRight,
            color: Get.theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
