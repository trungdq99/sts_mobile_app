/*
 * Author: Trung Shin
 */

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/cubits/cubits.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/models/models.dart';
import 'package:sts/utils/utils.dart';

import 'widgets/widgets.dart';

class AttendancePage extends StatefulWidget {
  final ShiftAttendanceBloc shiftAttendanceBloc;
  const AttendancePage({
    Key key,
    @required this.shiftAttendanceBloc,
  }) : super(key: key);

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    _refreshCompleter = Completer<void>();
    widget.shiftAttendanceBloc
        .add(ShiftAttendanceEventGet(selectedWeek: DateTimeUtil.getCurWeek()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedWeekCubit(),
      child: Scaffold(
        appBar: AppBarCustomWidget(
          title: Text(
            'Attendance Report',
            style: Get.textTheme.headline6,
          ),
          showBackButton: true,
        ),
        body: BlocConsumer<ShiftAttendanceBloc, ShiftAttendanceState>(
          bloc: widget.shiftAttendanceBloc,
          listener: (context, state) {
            if (state.status == ShiftAttendanceStatus.loadingSuccessful) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
            } else if (state.status == ShiftAttendanceStatus.loadingFailure) {
              if (Get.isDialogOpen) Get.back();
              Get.dialog(NotificationDialogCustomWidget(
                message: state.message,
                isPop: false,
              ));
            }
          },
          builder: (context, state) {
            return BlocBuilder<SelectedWeekCubit, DateTimeRange>(
              builder: (context, dateTimeRange) {
                return RefreshIndicator(
                  color: Get.theme.primaryColor,
                  onRefresh: () {
                    widget.shiftAttendanceBloc.add(
                        ShiftAttendanceEventGet(selectedWeek: dateTimeRange));
                    return _refreshCompleter.future;
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      BlocProvider.value(
                        value: widget.shiftAttendanceBloc,
                        child: ListShiftAttendanceWidget(),
                      ),
                      state.status == ShiftAttendanceStatus.loading
                          ? FullScreenProgressingCustomWidget()
                          : SizedBox(),
                      Positioned(
                        bottom: 0,
                        child: BlocProvider.value(
                          value: widget.shiftAttendanceBloc,
                          child: WeekWidget(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
            // return SingleChildScrollView(
            //   padding: EdgeInsets.all(20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       for (int i = 0; i < state.listShiftAttendance.length; i++)
            //         _buildAttendance(state.listShiftAttendance[i]),
            //     ],
            //   ),
            // );
          },
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

  Widget _buildAttendance(ShiftAttendanceModel shiftAttendanceModel) {
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
