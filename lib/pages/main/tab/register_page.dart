import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: Text(
          'Đăng ký',
          style: Get.textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  color: ColorUtil.BLUE,
                ),
                SizedBox(
                  width: 10,
                ),
                ButtonCustomWidget(
                  margin: EdgeInsets.all(0),
                  child: Text(
                    'Passio Coffee FPTU',
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: ColorUtil.BLUE,
                ),
                SizedBox(
                  width: 10,
                ),
                ButtonCustomWidget(
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
                  color: ColorUtil.BLUE,
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
            Row(
              children: [
                // Expanded(
                //   child: ButtonCustomWidget(
                //     gradient: GradientUtil.leftRight(),
                //     margin: EdgeInsets.all(0),
                //     child: Text(
                //       'Xin nghỉ',
                //       style: Get.textTheme.button,
                //     ),
                //     onPressed: () {},
                //   ),
                // ),
                // SpaceUtil.horizontalDefault(),
                Expanded(
                  child: ButtonCustomWidget(
                    margin: EdgeInsets.all(0),
                    color: Get.theme.primaryColor,
                    child: Text(
                      'Đăng ký làm',
                      style: Get.textTheme.button.copyWith(
                        color: ColorUtil.WHITE,
                      ),
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
