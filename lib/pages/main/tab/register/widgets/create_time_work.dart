/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/utils/utils.dart';
import '../edit_time_work/time_work_cubit.dart';

class CreateTimeWorkWidget extends StatelessWidget {
  final TimeWorkCubit controller;
  final ValueChanged<DateTimeRange> onSaved;

  CreateTimeWorkWidget({
    Key key,
    TimeWorkCubit controller,
    this.onSaved,
  })  : controller = controller ?? TimeWorkCubit(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeWorkCubit, DateTimeRange>(
      bloc: controller,
      builder: (context, state) {
        return Center(
          child: ContainerCustomWidget(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  DateTimeUtil.convertDateTimeToString(
                    dateTime: state.start,
                    format: DateTimeUtil.DMY,
                  ),
                  style: Get.textTheme.bodyText1.copyWith(
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonCustomWidget(
                      onPressed: () {
                        DatePicker.showPicker(
                          context,
                          theme: DatePickerTheme(
                            backgroundColor: Get.theme.scaffoldBackgroundColor,
                            doneStyle: Get.textTheme.button.copyWith(
                              color: Get.theme.primaryColor,
                            ),
                            cancelStyle: Get.textTheme.button,
                            headerColor: Get.theme.backgroundColor,
                            itemStyle: Get.textTheme.button,
                          ),
                          pickerModel:
                              PickerModelCustom(currentTime: state.start),
                          onConfirm: (time) {
                            controller.setTimeStart(timeStart: time);
                          },
                        );
                      },
                      child: Text(
                        DateTimeUtil.convertDateTimeToString(
                          dateTime: state.start,
                          format: DateTimeUtil.hm,
                        ),
                        style: Get.textTheme.button,
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.minus,
                      color: Get.theme.accentColor,
                    ),
                    ButtonCustomWidget(
                      onPressed: () {
                        DatePicker.showPicker(
                          context,
                          theme: DatePickerTheme(
                            backgroundColor: Get.theme.scaffoldBackgroundColor,
                            doneStyle: Get.textTheme.button.copyWith(
                              color: Get.theme.primaryColor,
                            ),
                            cancelStyle: Get.textTheme.button,
                            headerColor: Get.theme.backgroundColor,
                            itemStyle: Get.textTheme.button,
                          ),
                          pickerModel:
                              PickerModelCustom(currentTime: state.end),
                          onConfirm: (time) {
                            controller.setTimeEnd(timeEnd: time);
                          },
                        );
                      },
                      child: Text(
                        DateTimeUtil.convertDateTimeToString(
                          dateTime: state.end,
                          format: DateTimeUtil.hm,
                        ),
                        style: Get.textTheme.button,
                      ),
                    ),
                  ],
                ),
                ButtonCustomWidget(
                  onPressed: () {
                    if (onSaved != null)
                      onSaved(state);
                    else
                      Get.back();
                  },
                  color: Get.theme.primaryColor,
                  child: Text(
                    'Save',
                    style: Get.textTheme.button.copyWith(
                      color: ColorUtil.TEXT_COLOR_DARK,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
