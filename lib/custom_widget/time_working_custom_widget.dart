import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:measured_size/measured_size.dart';

class TimeWorkingCustomWidget extends StatefulWidget {
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
    return Row(
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
              Icon(FontAwesomeIcons.hourglassStart),
              SizedBox(
                height: 10,
              ),
              Text('09:00'),
            ],
          ),
        ),
        FaIcon(FontAwesomeIcons.minus),
        Column(
          children: [
            Icon(FontAwesomeIcons.hourglassEnd),
            SizedBox(
              height: 10,
            ),
            Text('14:00'),
          ],
        ),
        SizedBox(
          height: _height,
          child: VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        Column(
          children: [
            Icon(FontAwesomeIcons.solidHourglass),
            SizedBox(
              height: 10,
            ),
            Text('05:00'),
          ],
        ),
      ],
    );
  }
}
