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

class WorkReportRepository {
  WorkReportRepository();

  // Get shift attendances
  Future<WorkReportModel> getShiftAttendance({
    @required DateTimeRange selectedWeek,
  }) async {
    String api = UrlUtil.GET_WORK_REPORT;
    if (selectedWeek != null) {
      api += '?FromDate=${DateTimeUtil.convertDateTimeToString(
        dateTime: selectedWeek.start,
        format: DateTimeUtil.YMD,
      )}&ToDate=${DateTimeUtil.convertDateTimeToString(
        dateTime: selectedWeek.end,
        format: DateTimeUtil.YMD,
      )}';
    }

    // Call Get User Api
    Response response = await apiClient.fetchData(
      api: api,
      method: RequestMethod.GET,
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      // Convert response body to WorkReport Model
      Map<String, dynamic> json = response.body;
      WorkReportModel workReportModel = WorkReportModel.fromJson(json);
      return workReportModel;
    } else {
      throw Exception(status);
    }
  }
}
