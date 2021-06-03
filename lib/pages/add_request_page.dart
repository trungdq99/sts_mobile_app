import 'package:flutter/material.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/custom_widget/time_working_custom_widget.dart';

class AddRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Request'),
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
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('2 June 2021'),
                ),
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  child: Text('Take leave'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Take Shift'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
