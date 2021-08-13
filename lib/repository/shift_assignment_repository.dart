/*
 * Author: Trung Shin
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/constant.dart';
import 'package:sts/models/models.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';
import 'api_client.dart';

class ShiftAssignmentRepository {
  ShiftAssignmentRepository();

  final StreamController<List<ShiftAssignmentModel>> _controller =
      StreamController<List<ShiftAssignmentModel>>();

  Stream<List<ShiftAssignmentModel>> get curWeekAssignment async* {
    yield* _controller.stream;
  }

  void dispose() => _controller.close();

  // Get shift registers
  Future<List<ShiftAssignmentModel>> getShiftAssignments(
      {DateTimeRange selectedWeek}) async {
    String api = UrlUtil.GET_SHIFT_ASSIGNMENT;
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
      final List<dynamic> list = response.body;
      List<ShiftAssignmentModel> listShiftRegisterModel = [];
      list.forEach((element) {
        Map<String, dynamic> json = element;
        listShiftRegisterModel.add(ShiftAssignmentModel.fromJson(json));
      });
      if (DateTimeUtil.isSameWeek(DateTimeUtil.getCurWeek(), selectedWeek)) {
        _controller.add(listShiftRegisterModel);
      }
      return listShiftRegisterModel;
    } else {
      throw Exception(status);
    }
  }
}
