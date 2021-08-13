/*
 * Author: Trung Shin
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/constant.dart';
import 'package:sts/models/models.dart';
import 'package:sts/utils/utils.dart';
import 'api_client.dart';

class WeekScheduleRepository {
  WeekScheduleRepository();

  // Get shift registers
  Future<WeekScheduleModel> getWeekSchedule(
      {@required DateTimeRange selectedWeek}) async {
    String api = UrlUtil.GET_WEEK_SCHEDULE;
    api += '?dateStart=${DateTimeUtil.convertDateTimeToString(
      dateTime: selectedWeek.start,
      format: DateTimeUtil.YMD,
    )}';

    // Call Get User Api
    Response response = await apiClient.fetchData(
      api: api,
      method: RequestMethod.GET,
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      // Convert response body to WeekScheduleModel
      final List<dynamic> list = response.body;
      List<WeekScheduleModel> listWeekScheduleModel = [];
      list.forEach((element) {
        Map<String, dynamic> json = element;
        listWeekScheduleModel.add(WeekScheduleModel.fromJson(json));
      });
      return listWeekScheduleModel[0];
    } else {
      throw Exception(status);
    }
  }
}
