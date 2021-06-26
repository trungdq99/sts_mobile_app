/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/cubits/select_week_cubit.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/models/time_work_model.dart';
import 'package:sts/utils/date_time_util.dart';

class RegisterListWidget extends StatefulWidget {
  final List<TimeWorkModel> listTimeWorks;
  const RegisterListWidget({
    Key key,
    @required this.listTimeWorks,
  }) : super(key: key);

  @override
  _RegisterListWidgetState createState() => _RegisterListWidgetState();
}

class _RegisterListWidgetState extends State<RegisterListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectWeekCubit, DateTimeRange>(
      builder: (context, state) {
        return Column(
          children: [
            for (int i = 0; i < 7; i++)
              _buildDate(dateTime: state.start.add(Duration(days: i))),
          ],
        );
      },
    );
  }

  Widget _buildDate({
    @required DateTime dateTime,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateTimeUtil.convertDateToString(dateTime),
          style: Get.textTheme.bodyText1.copyWith(
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: Get.width / 120,
          addAutomaticKeepAlives: true,
          shrinkWrap: true,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          padding: EdgeInsets.all(10),
          children: List.generate(4, (index) {
            if (index < 3)
              return _buildTime('07:00', '12:00');
            else
              return ButtonCustomWidget(
                onPressed: () {},
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                boxShape: NeumorphicBoxShape.circle(),
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: Get.theme.accentColor,
                ),
              );
          }),
        ),
        Divider(
          color: Get.theme.accentColor,
          height: 20,
          thickness: 2,
        ),
      ],
    );
  }

  Widget _buildTime(String startTime, String endTime) {
    return ButtonCustomWidget(
      onPressed: () {},
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      child: Text(
        '$startTime - $endTime',
      ),
    );
  }
}
