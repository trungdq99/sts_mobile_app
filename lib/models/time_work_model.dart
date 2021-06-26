/*
 * Author: Trung Shin
 */

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sts/utils/date_time_util.dart';

class TimeWorkModel extends Equatable {
  final DateTime date;
  final String startTime;
  final String endTime;

  TimeWorkModel({
    @required this.date,
    @required this.startTime,
    @required this.endTime,
  });

  TimeWorkModel copyWith({
    DateTime date,
    String startTime,
    String endTime,
  }) =>
      TimeWorkModel(
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );

  DateTimeRange get timeWork => DateTimeUtil.getDateTimeRange(
        date,
        startTime,
        endTime,
      );

  @override
  List<Object> get props => [
        date,
        startTime,
        endTime,
      ];
}
