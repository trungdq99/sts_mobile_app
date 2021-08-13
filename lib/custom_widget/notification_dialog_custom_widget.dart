/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/utils/space_util.dart';

class NotificationDialogCustomWidget extends StatefulWidget {
  final VoidCallback onConfirm;
  final String title;
  final String message;
  final bool isPop;
  const NotificationDialogCustomWidget({
    this.onConfirm,
    this.title: '',
    this.message: '',
    this.isPop: true,
  });

  @override
  _NotificationDialogCustomWidgetState createState() =>
      _NotificationDialogCustomWidgetState();
}

class _NotificationDialogCustomWidgetState
    extends State<NotificationDialogCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return widget.isPop;
      },
      child: Center(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return ContainerCustomWidget(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          _buildMessage(),
          SpaceUtil.verticalDefault(),
          _buildConfirmButton(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: Get.textTheme.bodyText1.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMessage() {
    return Text(
      widget.message,
      style: Get.textTheme.bodyText2,
    );
  }

  Widget _buildConfirmButton() {
    return ButtonCustomWidget(
      onPressed: () {
        if (widget.onConfirm != null) {
          widget.onConfirm();
        } else {
          Get.back();
        }
      },
      color: Get.theme.primaryColor,
      margin: EdgeInsets.all(0),
      alignment: null,
      child: Text(
        'Confirm',
        style: Get.textTheme.button.copyWith(
          color: Get.theme.backgroundColor,
        ),
      ),
    );
  }
}
