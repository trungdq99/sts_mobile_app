import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/space_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInfo(),
            _buildWorkingShift(),
            // SpaceUtil.verticalBig(),
            _buildUpcomingShift(),
            SpaceUtil.verticalDefault(),
            _buildAvailableShift(),
            SpaceUtil.verticalDefault(),
            _buildTimesheets(),
            SpaceUtil.verticalBig(),
            _buildLeave(),
            SpaceUtil.verticalDefault(),
            _buildUnavailability(),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkingShift() {
    return ButtonCustomWidget(
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      color: Get.theme.primaryColor,
      padding: EdgeInsets.all(20),
      alignment: Alignment.centerLeft,
      onPressed: () {
        // Get.toNamed(
        //   RouteUtil.SHIFT_DETAIL,
        //   arguments: 'Sắp tới',
        // );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ca làm: 14:00 - 19:00',
                style: Get.textTheme.bodyText1.copyWith(
                  color: ColorUtil.WHITE,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                FontAwesomeIcons.solidClock,
                color: ColorUtil.WHITE,
              ),
            ],
          ),
          SpaceUtil.verticalSmall(),
          IconTextCustomWidget(
            icon: FontAwesomeIcons.mapMarkerAlt,
            text: 'Passio Coffee FPTU',
            color: ColorUtil.WHITE,
          ),
          SpaceUtil.verticalSmall(),
          IconTextCustomWidget(
            icon: FontAwesomeIcons.tag,
            text: 'Pha chế',
            color: ColorUtil.WHITE,
          ),
          Divider(
            color: ColorUtil.WHITE,
            thickness: 2,
          ),
          Text(
            'Điểm danh:',
            style: Get.textTheme.bodyText1.copyWith(
              color: ColorUtil.WHITE,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              ContainerCustomWidget(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 2,
                ),
                margin: EdgeInsets.all(5),
                radius: 30,
                child: Text(
                  '13:55',
                  style: Get.textTheme.button,
                ),
              ),
              ContainerCustomWidget(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 2,
                ),
                margin: EdgeInsets.all(5),
                radius: 30,
                child: Text(
                  '14:00',
                  style: Get.textTheme.button,
                ),
              ),
              ContainerCustomWidget(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 2,
                ),
                margin: EdgeInsets.all(5),
                radius: 30,
                child: Text(
                  '14:05',
                  style: Get.textTheme.button,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUnavailability() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {},
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.calendarTimes,
          color: Get.theme.primaryColor,
        ),
        title: Text(
          'Ngày không thể làm',
          style: Get.textTheme.button,
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildLeave() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {},
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.calendarMinus,
          color: Get.theme.primaryColor,
        ),
        title: Text(
          'Xin nghỉ',
          style: Get.textTheme.button,
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildUpcomingShift() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {},
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.calendarAlt,
          color: Get.theme.primaryColor,
        ),
        title: Text(
          'Ca sắp làm',
          style: Get.textTheme.button,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ContainerCustomWidget(
              isUp: false,
              boxShape: NeumorphicBoxShape.circle(),
              padding: EdgeInsets.all(10),
              child: Text(
                '1',
                style: Get.textTheme.button,
              ),
            ),
            SpaceUtil.horizontalDefault(),
            Icon(
              FontAwesomeIcons.chevronRight,
              color: Get.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailableShift() {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      onPressed: () {},
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.calendarPlus,
          color: Get.theme.primaryColor,
        ),
        title: Text(
          'Ca còn trống',
          style: Get.textTheme.button,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ContainerCustomWidget(
              isUp: false,
              boxShape: NeumorphicBoxShape.circle(),
              padding: EdgeInsets.all(10),
              child: Text(
                '3',
                style: Get.textTheme.button,
              ),
            ),
            SpaceUtil.horizontalDefault(),
            Icon(
              FontAwesomeIcons.chevronRight,
              color: Get.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimesheets() {
    return ButtonCustomWidget(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      onPressed: () {},
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.calendarCheck,
          color: Get.theme.primaryColor,
        ),
        title: Text(
          'Xem điểm danh',
          style: Get.textTheme.button,
        ),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return ListTile(
      leading: ContainerCustomWidget(
        boxShape: NeumorphicBoxShape.circle(),
        padding: EdgeInsets.all(10),
        color: Get.theme.primaryColor,
        child: Icon(
          Icons.person,
          color: ColorUtil.WHITE,
        ),
      ),
      title: Text(
        'Tony Staff',
        style: Get.textTheme.headline6,
      ),
      subtitle: Text(
        'I am Tony Staff',
        style: Get.textTheme.bodyText2,
      ),
      contentPadding: EdgeInsets.all(0),
    );
  }
}
