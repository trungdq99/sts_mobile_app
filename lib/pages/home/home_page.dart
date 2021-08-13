/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sts/pages/home/widgets/widgets.dart';
import 'package:sts/utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            InfoWidget(),
            SpaceUtil.verticalSmall(),
            LastAttendanceWidget(),
            SpaceUtil.verticalDefault(),
            WorkReportWidget(),
            SpaceUtil.verticalDefault(),
            UpcomingShiftWidget(),
            // SpaceUtil.verticalDefault(),
            // _buildAvailableShift(),
          ],
        ),
      ),
    );
  }

  // Widget _buildAvailableShift() {
  //   return ButtonCustomWidget(
  //     margin: EdgeInsets.all(0),
  //     padding: EdgeInsets.all(10),
  //     alignment: Alignment.centerLeft,
  //     onPressed: () {
  //       Get.toNamed(
  //         RouteUtil.SHIFT_DETAIL,
  //       );
  //     },
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'Ca còn trống',
  //                 style: Get.textTheme.bodyText1.copyWith(
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               IconTextCustomWidget(
  //                 icon: FontAwesomeIcons.calendar,
  //                 text: '20 Jun 2021, 14:00 - 19:00',
  //                 iconColor: ColorUtil.BLUE1,
  //               ),
  //               IconTextCustomWidget(
  //                 icon: FontAwesomeIcons.mapMarkerAlt,
  //                 text: 'Passio Coffee FPTU',
  //                 iconColor: ColorUtil.BLUE2,
  //               ),
  //               IconTextCustomWidget(
  //                 icon: FontAwesomeIcons.tag,
  //                 text: 'Pha chế',
  //                 iconColor: ColorUtil.BLUE3,
  //               ),
  //             ],
  //           ),
  //         ),
  //         Icon(
  //           FontAwesomeIcons.chevronRight,
  //           color: Get.theme.primaryColor,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
