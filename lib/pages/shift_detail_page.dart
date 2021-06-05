import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/custom_widget/time_working_custom_widget.dart';

class ShiftDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shift Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconTextCustomWidget(
              icon: Icons.location_on,
              text: 'Passio Coffee FPTU',
            ),
            SizedBox(
              height: 20,
            ),
            IconTextCustomWidget(
              icon: FontAwesomeIcons.tag,
              text: 'Bartender',
            ),
            SizedBox(
              height: 20,
            ),
            IconTextCustomWidget(
              icon: Icons.calendar_today,
              text: 'Wednesday, 2 June 2021',
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 40,
              ),
              child: TimeWorkingCustomWidget(),
            ),
            SizedBox(
              height: 20,
            ),
            IconTextCustomWidget(
              icon: Icons.mode_comment,
              text: 'Some notes for this shift...',
            ),
            SizedBox(
              height: 20,
            ),
            IconTextCustomWidget(
              icon: Icons.fastfood,
              text: '30 min',
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(Icons.people),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    Text('Person 1'),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    Text('Person 2'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  child: Text('Leave'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Swap'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
