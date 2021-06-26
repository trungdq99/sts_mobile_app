/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/custom_widget/time_working_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/gradient_util.dart';
import 'package:sts/utils/space_util.dart';

class AddRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: Text(
          'Add Request',
          style: Get.textTheme.bodyText1.copyWith(
            color: ColorUtil.WHITE,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconTextCustomWidget(
              icon: Icons.location_on,
              text: 'Passio Coffee FPTU',
              textStyle: Get.textTheme.button,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: ColorUtil.PRIMARY_LIGHT,
                ),
                SizedBox(
                  width: 10,
                ),
                ButtonCustomWidget(
                  gradient: GradientUtil.topBottom(),
                  margin: EdgeInsets.all(0),
                  child: Text(
                    DateFormat('E, dd MMM yyyy').format(DateTime.now()),
                    style: Get.textTheme.button,
                  ),
                  onPressed: () {},
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text('2 June 2021'),
                // ),
              ],
            ),
            SpaceUtil.verticalSmall(),
            Padding(
              padding: EdgeInsets.only(
                left: 40,
              ),
              child: TimeWorkingCustomWidget(),
            ),
            SpaceUtil.verticalDefault(),
            Row(
              children: [
                Icon(
                  Icons.people,
                  color: ColorUtil.PRIMARY_LIGHT,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    ContainerCustomWidget(
                      gradient: GradientUtil.topBottom(),
                      child: Icon(
                        Icons.person,
                        color: ColorUtil.WHITE,
                      ),
                      boxShape: NeumorphicBoxShape.circle(),
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      'Person 1',
                      style: Get.textTheme.bodyText2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SpaceUtil.horizontalDefault(),
                Column(
                  children: [
                    ContainerCustomWidget(
                      gradient: GradientUtil.topBottom(),
                      child: Icon(
                        Icons.person,
                        color: ColorUtil.WHITE,
                      ),
                      boxShape: NeumorphicBoxShape.circle(),
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      'Person 2',
                      style: Get.textTheme.bodyText2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonCustomWidget(
                    gradient: GradientUtil.leftRight(),
                    margin: EdgeInsets.all(0),
                    child: Text(
                      'Xin nghỉ',
                      style: Get.textTheme.button,
                    ),
                    onPressed: () {},
                  ),
                ),
                SpaceUtil.horizontalDefault(),
                Expanded(
                  child: ButtonCustomWidget(
                    gradient: GradientUtil.rightLeft(),
                    margin: EdgeInsets.all(0),
                    child: Text(
                      'Đăng ký làm',
                      style: Get.textTheme.button,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
