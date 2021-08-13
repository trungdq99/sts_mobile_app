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

class ShiftRegistersRepository {
  ShiftRegistersRepository();

  // Get shift registers
  Future<List<ShiftRegisterModel>> getShiftRegisters(
      {DateTimeRange selectedWeek}) async {
    String api = UrlUtil.GET_SHIFT_REGISTERS;
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
      List<ShiftRegisterModel> listShiftRegisterModel = [];
      list.forEach((element) {
        Map<String, dynamic> json = element;
        listShiftRegisterModel.add(ShiftRegisterModel.fromJson(json));
      });
      return listShiftRegisterModel;
      // _controller.add(userModel);
    } else {
      throw Exception(status);
    }
  }

  // Add Shift register
  Future<bool> addShiftRegister({
    @required DateTimeRange timeWorks,
    @required String username,
    @required int weekScheduleId,
  }) async {
    // Call Get User Api
    Response response = await apiClient.fetchData(
      api: UrlUtil.ADD_SHIFT_REGISTER,
      method: RequestMethod.POST,
      body: {
        'username': username,
        'weekScheduleId': weekScheduleId,
        'timeWorks': [
          {
            'timeStart': DateTimeUtil.convertDateTimeToString(
                dateTime: timeWorks.start, format: DateTimeUtil.YMDhms),
            'timeEnd': DateTimeUtil.convertDateTimeToString(
                dateTime: timeWorks.end, format: DateTimeUtil.YMDhms),
          }
        ],
      },
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      return true;
    } else {
      throw Exception(status);
    }
  }

  // Add Shift register
  Future<bool> updateShiftRegister({
    @required DateTimeRange timeWorks,
    @required int id,
  }) async {
    // Call Get User Api
    Response response = await apiClient.fetchData(
      api: '${UrlUtil.ADD_SHIFT_REGISTER}/$id',
      method: RequestMethod.PUT,
      body: {
        'timeStart': DateTimeUtil.convertDateTimeToString(
            dateTime: timeWorks.start, format: DateTimeUtil.YMDhms),
        'timeEnd': DateTimeUtil.convertDateTimeToString(
            dateTime: timeWorks.end, format: DateTimeUtil.YMDhms),
      },
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      return true;
    } else {
      throw Exception(status);
    }
  }

  // Delete Shift register
  Future<bool> deleteShiftRegister({
    @required int id,
  }) async {
    // Call Get User Api
    Response response = await apiClient.fetchData(
      api: '${UrlUtil.ADD_SHIFT_REGISTER}/$id',
      method: RequestMethod.DELETE,
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      return true;
    } else {
      throw Exception(status);
    }
  }
}
