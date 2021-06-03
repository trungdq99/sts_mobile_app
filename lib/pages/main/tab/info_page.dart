import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/utils/route_util.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInfo(),
            _buildTimeOfWork(),
            _buildRank(),
            _buildUpcomingShift(),
            _buildAvailableShift(),
            _buildRequestTimeOfShift(),
            SizedBox(
              height: 20,
            ),
            _buildEditProfileButton(),
            _buildJobInfoButton(),
            SizedBox(
              height: 20,
            ),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(){
    return ElevatedButton(
      onPressed: (){
        Get.offAllNamed(RouteUtil.LOGIN);
      },
      child: Text('Logout'),
    );
  }

  Widget _buildJobInfoButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteUtil.JOB_INFO);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.work),
          ),
          title: Text('Job Information'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteUtil.EDIT_PROFILE);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text('Edit Profile'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }

  Widget _buildUpcomingShift() {
    return InkWell(
      onTap: () {},
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text('icon'),
          ),
          title: RichText(
            text: new TextSpan(
              style: Get.textTheme.bodyText2,
              children: <TextSpan>[
                new TextSpan(
                  text: '1',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new TextSpan(
                  text: ' Upcoming Shift',
                ),
              ],
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }

  Widget _buildAvailableShift() {
    return InkWell(
      onTap: () {},
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text('icon'),
          ),
          title: RichText(
            text: new TextSpan(
              style: Get.textTheme.bodyText2,
              children: <TextSpan>[
                new TextSpan(
                  text: '2',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new TextSpan(
                  text: ' Available Shifts',
                ),
              ],
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }

  Widget _buildRequestTimeOfShift() {
    return InkWell(
      onTap: () {},
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text('icon'),
          ),
          title: RichText(
            text: new TextSpan(
              style: Get.textTheme.bodyText2,
              children: <TextSpan>[
                new TextSpan(
                  text: '3',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new TextSpan(
                  text: ' Request Time Of Shifts',
                ),
              ],
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }

  Widget _buildRank() {
    return ListTile(
      leading: FaIcon(FontAwesomeIcons.hashtag),
      title: Text('Top 1 at Passio Coffee FPTU'),
    );
  }

  Widget _buildTimeOfWork() {
    return ListTile(
      leading: FaIcon(FontAwesomeIcons.solidHourglass),
      title: Text('1000 hours of work'),
    );
  }

  Widget _buildInfo() {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text('Tony Staff'),
      subtitle: Text('I am Tony Staff'),
    );
  }
}
