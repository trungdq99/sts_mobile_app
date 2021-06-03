import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/utils/route_util.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            Get.toNamed(RouteUtil.SELECT_LOCATION);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Passio Coffee FPTU',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              onFormatChanged: (format) {},
              onDaySelected: (selectedDay, focusedDay) {
                print(selectedDay);
                print(focusedDay);
              },
              calendarFormat: CalendarFormat.week,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(),
            ),
            Card(
              margin: EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Get.toNamed(RouteUtil.SHIFT_DETAIL);
                },
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.solidHourglass),
                  title: Text('07:00 - 12:00'),
                  subtitle: Text('Bartender'),
                  trailing: FaIcon(
                    FontAwesomeIcons.solidTimesCircle,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Get.toNamed(RouteUtil.SHIFT_DETAIL);
                },
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.solidHourglass),
                  title: Text('09:00 - 14:00'),
                  subtitle: Text('Bartender'),
                  trailing: FaIcon(
                    FontAwesomeIcons.solidCheckCircle,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Get.toNamed(RouteUtil.SHIFT_DETAIL);
                },
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.solidHourglass),
                  title: Text('14:00 - 19:00'),
                  subtitle: Text('Cashier'),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed(RouteUtil.ADD_REQUEST);
              },
              child: Text('Add Request'),
            ),
          ],
        ),
      ),
    );
  }
}
