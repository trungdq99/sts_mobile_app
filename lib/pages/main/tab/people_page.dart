/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/space_util.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: Text(
          'Mọi người',
          style: Get.textTheme.headline6,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildPerson(
                name: 'Tony Staff',
                location: 'Passio Coffee FPTU',
                position: 'Pha chế',
              ),
              _buildPerson(
                name: 'Staff',
                location: 'Passio Coffee FPTU',
                position: 'Phục vụ',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPerson({
    @required String name,
    @required String location,
    @required String position,
  }) {
    return ButtonCustomWidget(
      margin: EdgeInsets.only(bottom: 20),
      onPressed: () {},
      child: Row(
        children: [
          ContainerCustomWidget(
            boxShape: NeumorphicBoxShape.circle(),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(0),
            color: Get.theme.primaryColor,
            child: Icon(
              FontAwesomeIcons.solidUser,
              color: ColorUtil.WHITE,
            ),
          ),
          SpaceUtil.horizontalSmall(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Get.textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.mapMarkerAlt,
                  text: location,
                  iconSize: 16,
                ),
                // SpaceUtil.verticalSmall(),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.tag,
                  text: position,
                  iconSize: 16,
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.solidHourglass,
                  text: '14:00 - 17:00',
                  iconSize: 16,
                ),
              ],
            ),
          ),
          ContainerCustomWidget(
            boxShape: NeumorphicBoxShape.circle(),
            color: Get.theme.primaryColor,
            child: Icon(
              FontAwesomeIcons.solidClock,
              color: ColorUtil.WHITE,
            ),
          ),
        ],
      ),
    );
  }
}
