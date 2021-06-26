/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/utils/space_util.dart';

class JobInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: Text(
          'Job Information',
          style: Get.textTheme.headline6,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildJobInfo(
              'Passio Coffee FPTU',
              30,
              'Bartender, Cashier',
            ),
            _buildJobInfo(
              '7-Elevent',
              40,
              'Cashier',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobInfo(String location, int hoursPerWeek, String position) {
    return ButtonCustomWidget(
      onPressed: () {},
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconTextCustomWidget(
            icon: FontAwesomeIcons.mapMarkerAlt,
            text: location,
            textStyle: Get.textTheme.button,
          ),
          SpaceUtil.verticalSmall(),
          Row(
            children: [
              SpaceUtil.horizontalDefault(),
              IconTextCustomWidget(
                icon: FontAwesomeIcons.solidFlag,
                text: 'Partime',
              ),
              SpaceUtil.horizontalDefault(),
              IconTextCustomWidget(
                  icon: FontAwesomeIcons.solidClock,
                  text: '$hoursPerWeek hours/week'),
            ],
          ),
          SpaceUtil.verticalSmall(),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: IconTextCustomWidget(
              icon: FontAwesomeIcons.tag,
              text: position,
            ),
          ),
        ],
      ),
    );
  }
}
