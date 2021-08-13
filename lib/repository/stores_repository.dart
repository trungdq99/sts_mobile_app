/*
 * Author: Trung Shin
 */

import 'dart:async';
import 'package:get/get.dart';
import 'package:sts/models/models.dart';
import 'package:sts/utils/utils.dart';

import '../constant.dart';
import 'repository.dart';

class StoresRepository {
  StoresRepository();

  final StreamController<List<StoreModel>> _controller =
      StreamController<List<StoreModel>>();

  Stream<List<StoreModel>> get listStores async* {
    yield* _controller.stream;
  }

  void dispose() => _controller.close();

  // Get store
  Future<void> getStores() async {
    // Call Get Store Api
    Response response = await apiClient.fetchData(
      api: UrlUtil.GET_STORE,
      method: RequestMethod.GET,
    );

    // Get Response status
    String status = ResponseStatusUtil.getStatus(response);

    // Check Response status is Success or not
    if (status == ResponseStatusUtil.SUCCESS) {
      // Convert response body to Store Model
      List<dynamic> list = response.body;
      List<StoreModel> listStores = [];
      list.forEach((element) {
        Map<String, dynamic> json = element;
        listStores.add(StoreModel.fromJson(json));
      });
      _controller.add(listStores);
    } else {
      throw Exception(status);
    }
  }
}
