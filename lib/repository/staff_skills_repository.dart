/*
 * Author: Trung Shin
 */

import 'dart:async';
import 'package:get/get.dart';
import 'package:sts/constant.dart';
import 'package:sts/models/models.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';
import 'api_client.dart';

class StaffSkillsRepository {
  StaffSkillsRepository();

  final StreamController<List<StaffSkillModel>> _controller =
      StreamController<List<StaffSkillModel>>();

  Stream<List<StaffSkillModel>> get staffSkills async* {
    yield* _controller.stream;
  }

  void dispose() => _controller.close();

  // Get Staff Skill
  Future<void> getSkills() async {
    String api = UrlUtil.GET_STAFF_SKILL;

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
      List<StaffSkillModel> listStaffSkillModel = [];
      list.forEach((element) async {
        Map<String, dynamic> json = element;
        StaffSkillModel staffSkillModel = StaffSkillModel.fromJson(json);

        SkillsRepository skillRepository = SkillsRepository();
        // SkillModel skillModel =
        //     await skillRepository.getSkills(id: staffSkillModel.id);
        // listStaffSkillModel.add(staffSkillModel.copyWith(
        //   name: skillModel.name,
        //   description: skillModel.description,
        // ));
      });
      _controller.add(listStaffSkillModel);
    } else {
      throw Exception(status);
    }
  }
}
