import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/pages/main/tab/schedule/cubit/calendar_cubit.dart';
import 'package:sts/utils/color_util.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  final DateTime selectedDay;

  const CalendarWidget({
    this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(builder: (context, state) {
      return TableCalendar(
        firstDay: DateTime.utc(2021, 1, 1),
        lastDay: DateTime.now().add(Duration(days: 30)),
        focusedDay: state.focusedDay,
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(state.selectedDay, selectedDay))
            context
                .read<CalendarCubit>()
                .updateDate(selectedDay: selectedDay, focusedDay: focusedDay);
        },
        selectedDayPredicate: (day) {
          return isSameDay(state.selectedDay, day);
        },
        headerVisible: false,
        calendarFormat: state.format,
        startingDayOfWeek: StartingDayOfWeek.monday,
        onFormatChanged: (format) {
          if (state.format != format) {
            context.read<CalendarCubit>().updateFormat(format: format);
          }
        },
        onPageChanged: (focusedDay) {
          context
              .read<CalendarCubit>()
              .updateFocusedDay(focusedDay: focusedDay);
        },
        calendarBuilders: CalendarBuilders(
          selectedBuilder: (context, day, focusedDay) {
            final dayStr = DateFormat.d().format(day);
            final monthStr = DateFormat.MMM().format(day);
            return ContainerCustomWidget(
              // boxShape: NeumorphicBoxShape.circle(),
              color: Get.theme.primaryColor,
              width: context.width / 7,
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(0),
              radius: 5,
              isUp: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayStr,
                    style: Get.textTheme.button.copyWith(
                      color: ColorUtil.WHITE,
                    ),
                  ),
                  Text(
                    monthStr,
                    style: Get.textTheme.button.copyWith(
                      color: ColorUtil.WHITE,
                    ),
                  ),
                ],
              ),
            );
          },
          dowBuilder: (context, day) {
            final text = DateFormat.E().format(day);
            return Center(
              child: Text(
                text,
                style: Get.textTheme.bodyText2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          defaultBuilder: (context, day, focusedDay) {
            final dayStr = DateFormat.d().format(day);
            final monthStr = DateFormat.MMM().format(day);
            return ContainerCustomWidget(
              width: context.width / 7,
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(0),
              radius: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayStr,
                    style: Get.textTheme.button.copyWith(
                      color: ColorUtil.PRIMARY_LIGHT,
                    ),
                  ),
                  Text(
                    monthStr,
                    style: Get.textTheme.button.copyWith(
                      color: ColorUtil.PRIMARY_LIGHT,
                    ),
                  ),
                ],
              ),
            );
          },
          todayBuilder: (context, day, focusedDay) {
            final dayStr = DateFormat.d().format(day);
            final monthStr = DateFormat.MMM().format(day);
            return ContainerCustomWidget(
              width: context.width / 7,
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(0),
              radius: 5,
              isUp: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayStr,
                    style: Get.textTheme.button,
                  ),
                  Text(
                    monthStr,
                    style: Get.textTheme.button,
                  ),
                ],
              ),
            );
          },
          disabledBuilder: (context, day, focusedDay) {
            final dayStr = DateFormat.d().format(day);
            final monthStr = DateFormat.MMM().format(day);
            return ContainerCustomWidget(
              width: context.width / 7,
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(0),
              radius: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayStr,
                    style: Get.textTheme.button.copyWith(
                      color: ColorUtil.PRIMARY_LIGHT,
                    ),
                  ),
                  Text(
                    monthStr,
                    style: Get.textTheme.button.copyWith(
                      color: ColorUtil.PRIMARY_LIGHT,
                    ),
                  ),
                ],
              ),
            );
          },
          outsideBuilder: (context, day, focusedDay) {
            final dayStr = DateFormat.d().format(day);
            final monthStr = DateFormat.MMM().format(day);
            return ContainerCustomWidget(
              width: context.width / 7,
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(0),
              radius: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayStr,
                    style: Get.textTheme.button.copyWith(
                      color: ColorUtil.PRIMARY_LIGHT,
                    ),
                  ),
                  Text(
                    monthStr,
                    style: Get.textTheme.button.copyWith(
                      color: ColorUtil.PRIMARY_LIGHT,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
