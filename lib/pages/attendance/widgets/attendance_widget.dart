/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/models/shift_attendance_model.dart';
import 'package:sts/utils/utils.dart';

class AttendanceWidget extends StatelessWidget {
  final ShiftAttendanceModel shiftAttendanceModel;
  const AttendanceWidget({
    Key key,
    @required this.shiftAttendanceModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonCustomWidget(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      radius: 10,
      alignment: Alignment.centerLeft,
      onPressed: () {},
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateTimeUtil.convertDateTimeFormat(
                    dateStr: shiftAttendanceModel.timeCheck,
                    fromFormat: DateTimeUtil.YMDhms,
                    toFormat: DateTimeUtil.DMY,
                  ),
                  style: Get.textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconTextCustomWidget(
                  icon: FontAwesomeIcons.solidHourglass,
                  text: DateTimeUtil.convertDateTimeFormat(
                    dateStr: shiftAttendanceModel.timeCheck,
                    fromFormat: DateTimeUtil.YMDhms,
                    toFormat: DateTimeUtil.hm,
                  ),
                  iconColor: ColorUtil.BLUE1,
                ),
                BlocBuilder<StoresBloc, StoresState>(
                  builder: (context, storesState) {
                    int index = -1;
                    if (storesState.listStores.isNotEmpty &&
                        storesState.status == StoresStatus.loadingSuccessful) {
                      index = storesState.listStores.indexWhere((element) =>
                          element.id == shiftAttendanceModel.storeId);
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
