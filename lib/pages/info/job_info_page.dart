import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';

class JobInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Information'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildJobInfo(
              'Passio Coffee FPTU',
              30,
              'Bartender, Cashier',
            ),
            SizedBox(
              height: 20,
            ),
            _buildJobInfo(
              'Passio Coffee',
              40,
              'Cashier',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobInfo(String location, int hoursPerWeek, String position) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconTextCustomWidget(icon: Icons.location_on, text: location),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            IconTextCustomWidget(icon: Icons.flag, text: 'Partime'),
            SizedBox(
              width: 20,
            ),
            IconTextCustomWidget(
                icon: Icons.timer, text: '$hoursPerWeek hours/week'),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child:
              IconTextCustomWidget(icon: FontAwesomeIcons.tag, text: position),
        ),
      ],
    );
    // return GridView.count(
    //   crossAxisCount: 1,
    //   crossAxisSpacing: 0,
    //   mainAxisSpacing: 0,
    //   // scrollDirection: Axis.horizontal,
    //   // shrinkWrap: true,
    //   // physics: BouncingScrollPhysics(),
    //   children: [
    //     // Container(height: 20, width: 20, color: Colors.teal,),
    //     // Container(height: 20, width: 20, color: Colors.black,),
    //     // Container(height: 20, width: 20, color: Colors.red,),
    //     // Container(height: 20, width: 20, color: Colors.black,),
    //     // Container(height: 20, width: 20, color: Colors.teal,),
    //     // Container(height: 20, width: 20, color: Colors.black,),
    //     IconTextCustomWidget(
    //         icon: Icons.location_on, text: 'Passio Coffee FPTU'),
    //     IconTextCustomWidget(
    //         icon: Icons.location_on, text: 'Passio Coffee FPTU'),
    //     IconTextCustomWidget(
    //         icon: Icons.location_on, text: 'Passio Coffee FPTU'),
    //     IconTextCustomWidget(
    //         icon: Icons.location_on, text: 'Passio Coffee FPTU'),
    //   ],
    // );
  }
}
