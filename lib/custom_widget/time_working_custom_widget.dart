/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:measured_size/measured_size.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/utils.dart';

class TimeWorkingCustomWidget extends StatefulWidget {
  final DateTimeRange dateTimeRange;
  const TimeWorkingCustomWidget({@required this.dateTimeRange});

  @override
  _TimeWorkingCustomWidgetState createState() =>
      _TimeWorkingCustomWidgetState();
}

class _TimeWorkingCustomWidgetState extends State<TimeWorkingCustomWidget> {
  double _height;
  @override
  void initState() {
    _height = 20;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerCustomWidget(
      margin: EdgeInsets.all(0),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MeasuredSize(
            onChange: (size) {
              setState(() {
                _height = size.height;
              });
            },
            child: Column(
              children: [
                CircleAvatarCustomWidget(
                  color: ColorUtil.BLUE1,
                  child: Icon(
                    FontAwesomeIcons.hourglassStart,
                    color: ColorUtil.TEXT_COLOR_DARK,
                  ),
                ),
                SpaceUtil.verticalSmall(),
                Text(
                  DateTimeUtil.convertDateTimeToString(
                    dateTime: widget.dateTimeRange.start,
                    format: DateTimeUtil.hm,
                  ),
                  style: Get.textTheme.button,
                ),
              ],
            ),
          ),
          SpaceUtil.horizontalSmall(),
          FaIcon(
            FontAwesomeIcons.minus,
            color: ColorUtil.PRIMARY_LIGHT,
          ),
          SpaceUtil.horizontalSmall(),
          Column(
            children: [
              CircleAvatarCustomWidget(
                color: ColorUtil.BLUE2,
                child: Icon(
                  FontAwesomeIcons.hourglassEnd,
                  color: ColorUtil.TEXT_COLOR_DARK,
                ),
              ),
              SpaceUtil.verticalSmall(),
              Text(
                DateTimeUtil.convertDateTimeToString(
                  dateTime: widget.dateTimeRange.end,
                  format: DateTimeUtil.hm,
                ),
                style: Get.textTheme.button,
              ),
            ],
          ),
          SizedBox(
            height: _height,
            child: VerticalDivider(
              color: ColorUtil.PRIMARY_LIGHT,
              thickness: 3,
              width: 40,
            ),
          ),
          Column(
            children: [
              CircleAvatarCustomWidget(
                color: ColorUtil.ORANGE,
                child: Icon(
                  FontAwesomeIcons.solidHourglass,
                  color: ColorUtil.TEXT_COLOR_DARK,
                ),
              ),
              SpaceUtil.verticalSmall(),
              Text(
                DateTimeUtil.dateTimeRangeToString(widget.dateTimeRange),
                style: Get.textTheme.button,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
