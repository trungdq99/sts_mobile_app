/*
 * Author: Trung Shin
 */
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sts/models/models.dart';
import 'package:sts/utils/utils.dart';
import '../constant.dart';
import 'repository.dart';

class BrandRepository {
  BrandRepository();

  final StreamController<BrandModel> _controller =
      StreamController<BrandModel>();

  Stream<BrandModel> get brand async* {
    yield* _controller.stream;
  }

  void dispose() => _controller.close();

  // Get store
  Future<void> getBrand({@required int id}) async {
    // Call Get Store Api
    Response response = await apiClient.fetchData(
      api: '${UrlUtil.GET_BRAND}/$id',
      method: RequestMethod.GET,
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      // Convert response body to Store Model
      Map<String, dynamic> json = response.body;
      BrandModel brandModel = BrandModel.fromJson(json);
      _controller.add(brandModel);
    } else {
      throw Exception(status);
    }
  }
}
