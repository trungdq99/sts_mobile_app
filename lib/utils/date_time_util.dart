/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtil {
  static const String DMY = 'dd - MM - yyyy';
  static const String YMDhms = 'yyyy-MM-ddThh:mm:ss';
  static const String EDMY = 'EE, dd - MM - yyyy';

  static DateTime convertStringToDateTime(String date) {
    DateTime result = DateTime.now();
    try {
      result = DateFormat(YMDhms).parse(date);
    } catch (e) {}
    return result;
  }

  static DateTime convertStringToDate(String date) {
    DateTime result = DateTime.now();
    try {
      result = DateFormat(DMY).parse(date);
    } catch (e) {}
    return result;
  }

  static String convertDateToString(DateTime date) {
    return DateFormat(EDMY).format(date);
  }

  static String convertDateString(DateTime date) {
    return DateFormat(DMY).format(date);
  }

  static String convertDateTimeString(DateTime date) {
    return DateFormat(YMDhms).format(date);
  }

  static String formatDateTimeStringToDateString(String date) {
    return convertDateString(convertStringToDateTime(date));
  }

  static String formatDateStringToDateTimeString(String date) {
    return convertDateTimeString(convertStringToDate(date));
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

  static DateTimeRange getCurWeek(DateTime current) {
    int currentWeekDay = current.weekday;
    return DateTimeRange(
      start: current.subtract(Duration(days: currentWeekDay - 1)),
      end: current.add(Duration(days: 7 - currentWeekDay)),
    );
  }

  static bool isSameWeek(DateTimeRange week1, DateTimeRange week2) {
    DateTime startWeek1 = week1.start;
    DateTime startWeek2 = week2.start;
    return startWeek1.day == startWeek2.day &&
        startWeek1.month == startWeek2.month &&
        startWeek1.year == startWeek2.year;
  }

  static bool isNextWeek(DateTimeRange week) {
    return isSameWeek(getNextWeek(DateTime.now()), week);
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
}
