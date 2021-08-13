/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/blocs/shift_registers/shift_registers_bloc.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import '../edit_time_work/time_work_cubit.dart';
import 'package:sts/utils/utils.dart';
import 'widgets.dart';

class DateWidget extends StatelessWidget {
  final DateTime dateTime;
  const DateWidget({
    Key key,
    @required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateTimeUtil.convertDateTimeToString(
                dateTime: dateTime,
                format: DateTimeUtil.EDMY,
              ),
              style: Get.textTheme.bodyText1.copyWith(
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SpaceUtil.verticalSmall(),
        _buildTimes(),
        Divider(
          color: Get.theme.accentColor,
          height: 20,
          thickness: 2,
        ),
      ],
    );
  }

  Widget _buildTimes() {
    return BlocBuilder<ShiftRegistersBloc, ShiftRegistersState>(
      builder: (context, state) {
        return SizedBox(
          width: Get.width,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              for (int i = state.listShiftRegisters.length - 1; i >= 0; i--)
                DateTimeUtil.isSameDay(
                        date1: dateTime,
                        date2: DateTimeUtil.convertStringToDateTime(
                          dateStr: state.listShiftRegisters[i].timeStart,
                          format: DateTimeUtil.YMDhms,
                        ))
                    ? ButtonCustomWidget(
                        onPressed: DateTimeUtil.isFutureWeek(state.selectedWeek)
                            ? () {
                                TimeWorkCubit _controller = TimeWorkCubit();
                                _controller.setTime(
                                    timeStart:
                                        DateTimeUtil.convertStringToDateTime(
                                      dateStr:
                                          state.listShiftRegisters[i].timeStart,
                                      format: DateTimeUtil.YMDhms,
                                    ),
                                    timeEnd:
                                        DateTimeUtil.convertStringToDateTime(
                                      dateStr:
                                          state.listShiftRegisters[i].timeEnd,
                                      format: DateTimeUtil.YMDhms,
                                    ));
                                Get.dialog(EditTimeWorkWidget(
                                  controller: _controller,
                                  onDeleted: (value) {
                                    BlocProvider.of<ShiftRegistersBloc>(context)
                                        .add(
                                      ShiftRegistersEventDelete(
                                          id: state.listShiftRegisters[i].id),
                                    );
                                  },
                                  onUpdated: (value) {
                                    if (BlocProvider.of<ShiftRegistersBloc>(
                                            context)
                                        .isValidShiftUpdate(
                                      dateTimeRange: value,
                                      id: state.listShiftRegisters[i].id,
                                    )) {
                                      BlocProvider.of<ShiftRegistersBloc>(
                                              context)
                                          .add(
                                        ShiftRegistersEventUpdate(
                                          timeWorks: value,
                                          id: state.listShiftRegisters[i].id,
                                        ),
                                      );
                                      Get.back();
                                    } else {
                                      Get.dialog(NotificationDialogCustomWidget(
                                        message: 'Time is not valid!',
                                      ));
                                    }
                                  },
                                ));
                              }
                            : () {},
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(5),
                        alignment: null,
                        child: Text(
                          '${DateTimeUtil.convertDateTimeFormat(
                            dateStr: state.listShiftRegisters[i].timeStart,
                            fromFormat: DateTimeUtil.YMDhms,
                            toFormat: DateTimeUtil.hm,
                          )} - ${DateTimeUtil.convertDateTimeFormat(
                            dateStr: state.listShiftRegisters[i].timeEnd,
                            fromFormat: DateTimeUtil.YMDhms,
                            toFormat: DateTimeUtil.hm,
                          )}',
                          style: Get.textTheme.button,
                        ),
                      )
                    : SizedBox(),
              DateTimeUtil.isFutureWeek(state.selectedWeek)
                  ? ButtonCustomWidget(
                      onPressed: () {
                        TimeWorkCubit _controller = TimeWorkCubit();
                        _controller.setTime(
                          timeStart: DateTime(
                            dateTime.year,
                            dateTime.month,
                            dateTime.day,
                            7,
                            0,
                            0,
                          ),
                          timeEnd: DateTime(
                            dateTime.year,
                            dateTime.month,
                            dateTime.day,
                            7,
                            30,
                            0,
                          ),
                        );
                        Get.dialog(CreateTimeWorkWidget(
                          controller: _controller,
                          onSaved: (value) {
                            if (BlocProvider.of<ShiftRegistersBloc>(context)
                                .isValidShiftAdd(dateTimeRange: value)) {
                              BlocProvider.of<ShiftRegistersBloc>(context)
                                  .add(ShiftRegistersEventAdd(
                                timeWorks: value,
                                weekScheduleId:
                                    BlocProvider.of<WeekScheduleBloc>(context)
                                        .state
                                        .weekScheduleModel
                                        .id,
                                userName: BlocProvider.of<UserBloc>(context)
                                    .state
                                    .userModel
                                    .username,
                              ));
                              Get.back();
                            } else {
                              Get.dialog(NotificationDialogCustomWidget(
                                message: 'Time is not valid!',
                              ));
                            }
                          },
                        ));
                      },
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(0),
                      alignment: null,
                      boxShape: NeumorphicBoxShape.circle(),
                      child: Icon(FontAwesomeIcons.plus),
                    )
                  : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
