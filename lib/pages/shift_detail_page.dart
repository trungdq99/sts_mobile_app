/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/custom_widget/time_working_custom_widget.dart';
import 'package:sts/models/shift_assignment_model.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/space_util.dart';
import 'package:sts/utils/utils.dart';

class ShiftDetailPage extends StatelessWidget {
  final ShiftAssignmentModel shiftAssignmentModel;
  const ShiftDetailPage({
    this.shiftAssignmentModel: ShiftAssignmentModel.empty,
  });
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
            ContainerCustomWidget(
              margin: EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
              child: BlocBuilder<StoresBloc, StoresState>(
                builder: (context, storesState) {
                  int index = -1;
                  if (storesState.listStores.isNotEmpty &&
                      storesState.status == StoresStatus.loadingSuccessful) {
                    index = storesState.listStores.indexWhere((element) =>
                        element.id == shiftAssignmentModel.storeId);
                  }
                  return IconTextCustomWidget(
                    icon: FontAwesomeIcons.mapMarkerAlt,
                    backgroundIconColor: ColorUtil.BLUE2,
                    iconColor: ColorUtil.WHITE,
                    text: index >= 0 ? storesState.listStores[index].name : '',
                    // iconColor: ColorUtil.BLUE2,
                  );
                },
              ),
            ),
            SpaceUtil.verticalDefault(),
            ContainerCustomWidget(
              margin: EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
              child: BlocBuilder<SkillsBloc, SkillsState>(
                builder: (context, skillsState) {
                  int index = -1;
                  if (skillsState.listSkills.isNotEmpty &&
                      skillsState.status == SkillsStatus.loadingSuccessful) {
                    index = skillsState.listSkills.indexWhere((element) =>
                        element.id == shiftAssignmentModel.skillId);
                  }
                  return IconTextCustomWidget(
                    icon: FontAwesomeIcons.tag,
                    text: index >= 0 ? skillsState.listSkills[index].name : '',
                    backgroundIconColor: ColorUtil.BLUE3,
                    iconColor: ColorUtil.WHITE,
                  );
                },
              ),
            ),
            SpaceUtil.verticalDefault(),
            ContainerCustomWidget(
              margin: EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
              child: IconTextCustomWidget(
                icon: FontAwesomeIcons.calendar,
                backgroundIconColor: ColorUtil.BLUE,
                iconColor: ColorUtil.WHITE,
                text: '${DateTimeUtil.convertDateTimeFormat(
                  dateStr: shiftAssignmentModel.timeStart,
                  fromFormat: DateTimeUtil.YMDhms,
                  toFormat: DateTimeUtil.DMY,
                )}',
              ),
            ),
            SpaceUtil.verticalDefault(),
            TimeWorkingCustomWidget(
              dateTimeRange: DateTimeRange(
                start: DateTimeUtil.convertStringToDateTime(
                  dateStr: shiftAssignmentModel.timeStart,
                  format: DateTimeUtil.YMDhms,
                ),
                end: DateTimeUtil.convertStringToDateTime(
                  dateStr: shiftAssignmentModel.timeEnd,
                  format: DateTimeUtil.YMDhms,
                ),
              ),
            ),
            SpaceUtil.verticalDefault(),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.people,
            //       color: ColorUtil.PRIMARY_LIGHT,
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Column(
            //       children: [
            //         ContainerCustomWidget(
            //           child: Icon(
            //             Icons.person,
            //             color: ColorUtil.WHITE,
            //           ),
            //           color: Get.theme.primaryColor,
            //           boxShape: NeumorphicBoxShape.circle(),
            //           height: 40,
            //           width: 40,
            //         ),
            //         Text(
            //           'Person 1',
            //           style: Get.textTheme.bodyText2.copyWith(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ],
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Column(
            //       children: [
            //         ContainerCustomWidget(
            //           color: Get.theme.primaryColor,
            //           child: Icon(
            //             Icons.person,
            //             color: ColorUtil.WHITE,
            //           ),
            //           boxShape: NeumorphicBoxShape.circle(),
            //           height: 40,
            //           width: 40,
            //         ),
            //         Text(
            //           'Person 2',
            //           style: Get.textTheme.bodyText2.copyWith(
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Get.arguments == 'Sắp tới'
            //     ?
            SpaceUtil.verticalBig(),
            Row(
              children: [
                Expanded(
                  child: ButtonCustomWidget(
                    margin: EdgeInsets.all(0),
                    child: Text(
                      'Request absence',
                      style: Get.textTheme.button,
                    ),
                    onPressed: () {},
                  ),
                ),
                SpaceUtil.horizontalDefault(),
                Expanded(
                  child: ButtonCustomWidget(
                    margin: EdgeInsets.all(0),
                    color: Get.theme.primaryColor,
                    child: Text(
                      'Request swap shift',
                      style: Get.textTheme.button.copyWith(
                        color: ColorUtil.TEXT_COLOR_DARK,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            // : SizedBox()
          ],
        ),
      ),
    );
  }
}
