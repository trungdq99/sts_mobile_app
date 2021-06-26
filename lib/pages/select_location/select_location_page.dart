/*
 * Author: Trung Shin
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/models/location_model.dart';
import 'package:sts/pages/select_location/widget/select_location_widget.dart';

// ignore: must_be_immutable
class SelectLocationPage extends StatelessWidget {
  Completer<void> _refreshCompleter = Completer<void>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          RefreshIndicator(
            color: Colors.teal,
            onRefresh: () {
              return _refreshCompleter.future;
            },
            child: SelectLocationWidget(
              children: [
                LocationModel(
                  id: 0,
                  name: 'All Locations',
                ),
                LocationModel(
                  id: 1,
                  name: 'Passio Coffee FPTU',
                ),
                LocationModel(
                  id: 2,
                  name: 'Passio Coffee',
                ),
              ],
              index: 0,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Select'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
