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

class ShiftAttendanceRepository {
  ShiftAttendanceRepository();

  // Get shift attendances
  Future<List<ShiftAttendanceModel>> getShiftAttendance(
      {DateTimeRange selectedWeek}) async {
    String api = UrlUtil.GET_SHIFT_ATTENDANCE;
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
      // Convert response body to User Model
      final List<dynamic> list = response.body;
      List<ShiftAttendanceModel> listShiftAttendanceModel = [];
      list.forEach((element) {
        Map<String, dynamic> json = element;
        listShiftAttendanceModel.add(ShiftAttendanceModel.fromJson(json));
      });
      return listShiftAttendanceModel;
      // _controller.add(userModel);
    } else {
      throw Exception(status);
    }
  }
}
