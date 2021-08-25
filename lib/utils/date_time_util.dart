/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sts/utils/utils.dart';

class DateTimeUtil {
  static const String DMY = 'dd - MM - yyyy';
  static const String YMDhms = 'yyyy-MM-ddTHH:mm:ss';
  static const String YMD = 'yyyy/MM/dd';
  static const String EDMY = 'EE, dd - MM - yyyy';
  static const String hm = 'HH:mm';
  static const String D = 'dd';
  static const String MMM = 'MMM';

  static DateTime convertStringToDateTime({
    @required String dateStr,
    @required String format,
  }) {
    DateTime result = DateTime.now();
    try {
      result = DateFormat(format).parse(dateStr);
    } catch (e) {}
    return result;
  }

  static String convertDateTimeToString({
    @required DateTime dateTime,
    @required String format,
  }) {
    return DateFormat(format).format(dateTime);
  }

  static String convertDateTimeFormat({
    @required String dateStr,
    @required String fromFormat,
    @required String toFormat,
  }) {
    if (toFormat == DMY) {
      if (isToday(
          dateTime:
              convertStringToDateTime(dateStr: dateStr, format: fromFormat)))
        return StringUtil.TODAY;
    }
    return convertDateTimeToString(
      dateTime: convertStringToDateTime(
        dateStr: dateStr,
        format: fromFormat,
      ),
      format: toFormat,
    );
  }

  static bool isSameDay({
    @required DateTime date1,
    @required DateTime date2,
  }) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static bool isToday({@required DateTime dateTime}) => isSameDay(
        date1: dateTime,
        date2: getCurDay(),
      );

  static DateTime getCurDay() {
    DateTime dateTime = DateTime.now();
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
    );
  }

  static DateTimeRange getCurWeek() {
    DateTime curDay = getCurDay();
    int currentWeekDay = curDay.weekday;
    return DateTimeRange(
      start: curDay.subtract(Duration(days: currentWeekDay - 1)),
      end: curDay.add(Duration(days: 7 - currentWeekDay)),
    );
  }

  static DateTimeRange getNextWeek(DateTime current) {
    int currentWeekDay = current.weekday;
    return DateTimeRange(
      start: current.add(Duration(days: 8 - currentWeekDay)),
      end: current.add(Duration(days: 14 - currentWeekDay)),
    );
  }

  static DateTimeRange getPrevWeek(DateTime current) {
    int currentWeekDay = current.weekday;
    return DateTimeRange(
      start: current.subtract(Duration(days: 6 + currentWeekDay)),
      end: current.subtract(Duration(days: currentWeekDay)),
    );
  }

  static DateTimeRange getWeek(DateTime dateTime) {
    int currentWeekDay = dateTime.weekday;
    return DateTimeRange(
      start: dateTime.subtract(Duration(days: currentWeekDay - 1)),
      end: dateTime.add(Duration(days: 7 - currentWeekDay)),
    );
  }

  static bool isSameWeek(DateTimeRange week1, DateTimeRange week2) {
    DateTime startWeek1 = week1.start;
    DateTime startWeek2 = week2.start;
    return isSameDay(
      date1: startWeek1,
      date2: startWeek2,
    );
  }

  static bool isFutureWeek(DateTimeRange week) {
    if (week != null) {
      DateTimeRange curWeek = getCurWeek();
      return week.start.isAfter(curWeek.end);
    } else {
      return false;
    }
  }

  static bool isFutureDay(DateTime dateTime) {
    DateTime current = DateTime.now();
    return current.isBefore(dateTime);
  }

  static List<int> convertTimeToNum(String time) {
    List<int> result = [0, 0];
    try {
      List<String> splitTime = time.split(':');
      if (splitTime.length == 2) {
        result.add(int.parse(splitTime[0]));
        result.add(int.parse(splitTime[1]));
      }
    } catch (e) {}
    return result;
  }

  static DateTimeRange getDateTimeRange(
      DateTime date, String start, String end) {
    List<int> timeStart = convertTimeToNum(start);
    List<int> timeEnd = convertTimeToNum(end);
    DateTime startTime = DateTime(
      date.year,
      date.month,
      date.day,
      timeStart[0],
      timeStart[1],
    );
    DateTime endTime = DateTime(
      date.year,
      date.month,
      date.day,
      timeEnd[0],
      timeEnd[1],
    );
    return DateTimeRange(
      start: startTime,
      end: endTime,
    );
  }

  static bool isValidDateTimeRange(
      DateTimeRange dateTimeRange1, DateTimeRange dateTimeRange2) {
    if (dateTimeRange1.start.isAfter(dateTimeRange2.start) &&
        dateTimeRange1.start.isAfter(dateTimeRange2.end)) {
      return true;
    } else if (dateTimeRange1.end.isBefore(dateTimeRange2.start) &&
        dateTimeRange1.end.isBefore(dateTimeRange2.end)) {
      return true;
    } else {
      return false;
    }
  }

  static String dateTimeRangeToString(DateTimeRange dateTimeRange) {
    return '${dateTimeRange.duration.inHours} hrs ${dateTimeRange.duration.inMinutes - dateTimeRange.duration.inHours * 60} min';
  }

  static pickTime({
    @required BuildContext context,
    DateTime currentTime,
    ValueChanged<DateTime> onConfirm,
  }) {
    DatePicker.showTimePicker(
      context,
      currentTime: currentTime ?? getCurDay(),
      showSecondsColumn: false,
      theme: DatePickerTheme(
        backgroundColor: Get.theme.backgroundColor,
        doneStyle: Get.textTheme.button.copyWith(
          color: Get.theme.primaryColor,
        ),
        cancelStyle: Get.textTheme.button,
        headerColor: Get.theme.scaffoldBackgroundColor,
        itemStyle: Get.textTheme.button,
      ),
      onConfirm: (time) {
        if (onConfirm != null) onConfirm(time);
      },
    );
  }
}
