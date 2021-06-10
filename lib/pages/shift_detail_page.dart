import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/back_button_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/custom_widget/shift_status_custom_widget.dart';
import 'package:sts/custom_widget/time_working_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/gradient_util.dart';
import 'package:sts/utils/space_util.dart';

class ShiftDetailPage extends StatelessWidget {
  const ShiftDetailPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: Text(
          'Shift Detail',
          style: Get.textTheme.headline6.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconTextCustomWidget(
                  icon: Icons.location_on,
                  text: 'Passio Coffee FPTU',
                  color: ColorUtil.BLUE,
                  fontWeight: FontWeight.bold,
                ),
                // ShiftStatusCustomWidget(
                //   status: Get.arguments,
                // ),
              ],
            ),
            SpaceUtil.verticalDefault(),
            IconTextCustomWidget(
              icon: FontAwesomeIcons.tag,
              text: 'Bartender',
              color: ColorUtil.BLUE,
              fontWeight: FontWeight.bold,
            ),
            SpaceUtil.verticalDefault(),
            IconTextCustomWidget(
              icon: Icons.calendar_today,
              text: 'Wednesday, 2 June 2021',
              color: ColorUtil.BLUE,
              fontWeight: FontWeight.bold,
            ),
            SpaceUtil.verticalSmall(),
            Padding(
              padding: EdgeInsets.only(
                left: 40,
              ),
              child: TimeWorkingCustomWidget(),
            ),
            SpaceUtil.verticalDefault(),
            IconTextCustomWidget(
              icon: Icons.mode_comment,
              text: 'Some notes for this shift...',
              color: ColorUtil.BLUE,
              fontWeight: FontWeight.bold,
            ),
            SpaceUtil.verticalDefault(),
            IconTextCustomWidget(
              icon: Icons.fastfood,
              text: '30 min',
              color: ColorUtil.BLUE,
              fontWeight: FontWeight.bold,
            ),
            SpaceUtil.verticalDefault(),
            Row(
              children: [
                Icon(
                  Icons.people,
                  color: ColorUtil.BLUE,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    ContainerCustomWidget(
                      child: Icon(
                        Icons.person,
                        color: ColorUtil.WHITE,
                      ),
                      color: Get.theme.primaryColor,
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
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    ContainerCustomWidget(
                      color: Get.theme.primaryColor,
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
            // Get.arguments == 'Sắp tới'
            //     ?
            Row(
              children: [
                Expanded(
                  child: ButtonCustomWidget(
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
                    margin: EdgeInsets.all(0),
                    child: Text(
                      'Xin đổi ca',
                      style: Get.textTheme.button,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            )
            // : SizedBox()
            ,
          ],
        ),
      ),
    );
  }
}
