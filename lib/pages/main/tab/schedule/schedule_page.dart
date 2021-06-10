import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/pages/main/tab/schedule/cubit/calendar_cubit.dart';
import 'package:sts/pages/main/tab/schedule/widget/calendar_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/function_util.dart';
import 'package:sts/utils/route_util.dart';
import 'package:sts/utils/space_util.dart';

class SchedulePage extends StatelessWidget {
  final CalendarCubit _calendarCubit = CalendarCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: TextButton(
          onPressed: () {
            Get.toNamed(RouteUtil.SELECT_LOCATION);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Passio Coffee FPTU',
                style: Get.textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Get.theme.primaryColor,
                size: 24,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                BlocProvider(
                  create: (context) => _calendarCubit,
                  child: CalendarWidget(),
                ),
                Row(
                  children: [
                    for (int i = 0; i < 7; i++)
                      Expanded(
                          child: ContainerCustomWidget(
                        height: Get.height,
                        color: ColorUtil.WHITE,
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(1),
                        radius: 0,
                        child: Column(
                          children: [
                            for (int j = 0; j <= i; j++)
                              SpaceUtil.verticalDefault(),
                            ButtonCustomWidget(
                              onPressed: () {
                                Get.toNamed(RouteUtil.SHIFT_DETAIL);
                              },
                              margin: EdgeInsets.all(2),
                              padding: EdgeInsets.all(0),
                              color: Get.theme.primaryColor,
                              height: 100,
                              radius: 5,
                              child: Text(
                                '09:00\n-\n14:00',
                                style: Get.textTheme.button.copyWith(
                                  color: ColorUtil.WHITE,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            for (int j = 0; j < i; j++)
                              SpaceUtil.verticalDefault(),
                            ButtonCustomWidget(
                              onPressed: () {},
                              margin: EdgeInsets.all(2),
                              padding: EdgeInsets.all(0),
                              color: Get.theme.primaryColor,
                              height: 100,
                              radius: 5,
                              child: Text(
                                '17:00\n-\n22:00',
                                style: Get.textTheme.button.copyWith(
                                  color: ColorUtil.WHITE,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Column(
              children: [
                BlocBuilder<CalendarCubit, CalendarState>(
                  bloc: _calendarCubit,
                  builder: (context, state) {
                    if (!FunctionUtil.isToday(date: state.selectedDay)) {
                      return ButtonCustomWidget(
                        boxShape:
                            NeumorphicBoxShape.roundRect(BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )),
                        margin: EdgeInsets.all(0),
                        onPressed: () {
                          _calendarCubit.today();
                        },
                        child: Text(
                          'Hôm nay',
                          style: Get.textTheme.button,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
                // ButtonCustomWidget(
                //   height: 40,
                //   width: 40,
                //   margin: EdgeInsets.all(20),
                //   boxShape: NeumorphicBoxShape.circle(),
                //   onPressed: () {
                //     Get.toNamed(RouteUtil.ADD_REQUEST);
                //   },
                //   child: Icon(
                //     FontAwesomeIcons.plus,
                //     color: ColorUtil.WHITE,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
