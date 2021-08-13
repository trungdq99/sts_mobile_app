/*
 * Author: Trung Shin
 */

import 'dart:async';
import 'package:get/get.dart';
import 'package:sts/models/models.dart';
import 'package:sts/utils/utils.dart';

import '../constant.dart';
import 'repository.dart';

class SkillsRepository {
  SkillsRepository();

  final StreamController<List<SkillModel>> _controller =
      StreamController<List<SkillModel>>();

  Stream<List<SkillModel>> get listSkills async* {
    yield* _controller.stream;
  }

  void dispose() => _controller.close();

  // Get shift registers
  Future<void> getSkills() async {
    String api = UrlUtil.GET_SKILL;

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
      List<dynamic> list = response.body;
      List<SkillModel> listSkills = [];
      list.forEach((element) {
        Map<String, dynamic> json = element;
        listSkills.add(SkillModel.fromJson(json));
      });
      _controller.add(listSkills);
    } else {
      throw Exception(status);
    }
  }
}
