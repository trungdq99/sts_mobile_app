/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/models/shift_assignment_model.dart';
import 'package:sts/utils/utils.dart';

class UpcomingShiftWidget extends StatelessWidget {
  const UpcomingShiftWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftAssignmentBloc, ShiftAssignmentState>(
      builder: (context, state) {
        if (state.status == ShiftAssignmentStatus.loadingSuccessful &&
            state.listCurWeekShiftAssignments.isNotEmpty) {
          int index = state.listCurWeekShiftAssignments.lastIndexWhere(
              (element) =>
                  DateTime.now().isBefore(DateTimeUtil.convertStringToDateTime(
                    dateStr: element.timeStart,
                    format: DateTimeUtil.YMDhms,
                  )));
          if (index >= 0) {
            return _buildUpcomingShift(
                state.listCurWeekShiftAssignments[index]);
          } else {
            return _buildEmptyShift();
          }
        } else if (state.status == ShiftAssignmentStatus.loading) {
          return _buildLoading();
        } else {
          return _buildEmptyShift();
        }
      },
    );
  }

  ContainerCustomWidget _buildEmptyShift() {
    return ContainerCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringUtil.UPCOMING_SHIFT,
            style: Get.textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SpaceUtil.verticalSmall(),
          Text(
            StringUtil.NO_UPCOMING_SHIFT,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  ContainerCustomWidget _buildLoading() {
    return ContainerCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringUtil.UPCOMING_SHIFT,
            style: Get.textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SpaceUtil.verticalSmall(),
          ProgressingCustomWidget(
            type: ProcessingType.text,
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingShift(ShiftAssignmentModel shiftAssignmentModel) {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      onPressed: () {
        Get.toNamed(
          RouteUtil.SHIFT_DETAIL,
          arguments: shiftAssignmentModel,
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringUtil.UPCOMING_SHIFT,
                  style: Get.textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SpaceUtil.verticalSmall(),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.calendar,
                  backgroundIconColor: ColorUtil.BLUE,
                  iconColor: ColorUtil.WHITE,
                  text: '${DateTimeUtil.convertDateTimeFormat(
                    dateStr: shiftAssignmentModel.timeStart,
                    fromFormat: DateTimeUtil.YMDhms,
                    toFormat: DateTimeUtil.DMY,
                  )}',
                ),
                SpaceUtil.verticalSmall(),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.solidHourglass,
                  backgroundIconColor: ColorUtil.BLUE1,
                  iconColor: ColorUtil.WHITE,
                  text: '${DateTimeUtil.convertDateTimeFormat(
                    dateStr: shiftAssignmentModel.timeStart,
                    fromFormat: DateTimeUtil.YMDhms,
                    toFormat: DateTimeUtil.hm,
                  )} - ${DateTimeUtil.convertDateTimeFormat(
                    dateStr: shiftAssignmentModel.timeEnd,
                    fromFormat: DateTimeUtil.YMDhms,
                    toFormat: DateTimeUtil.hm,
                  )}',
                ),
                SpaceUtil.verticalSmall(),
                BlocBuilder<StoresBloc, StoresState>(
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
                      text:
                          index >= 0 ? storesState.listStores[index].name : '',
                      // iconColor: ColorUtil.BLUE2,
                    );
                  },
                ),
                SpaceUtil.verticalSmall(),
                BlocBuilder<SkillsBloc, SkillsState>(
                  builder: (context, skillsState) {
                    int index = -1;
                    if (skillsState.listSkills.isNotEmpty &&
                        skillsState.status == SkillsStatus.loadingSuccessful) {
                      index = skillsState.listSkills.indexWhere((element) =>
                          element.id == shiftAssignmentModel.skillId);
                    }
                    return IconTextCustomWidget(
                      icon: FontAwesomeIcons.tag,
                      text:
                          index >= 0 ? skillsState.listSkills[index].name : '',
                      backgroundIconColor: ColorUtil.BLUE3,
                      iconColor: ColorUtil.WHITE,
                    );
                  },
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
