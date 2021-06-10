import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/text_field_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/gradient_util.dart';
import 'package:sts/utils/space_util.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: Text(
          'Edit Profile',
          style: Get.textTheme.headline6,
        ),
        showBackButton: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              _buildAvatar(context),
              SpaceUtil.verticalDefault(),
              _buildUsername(),
              SpaceUtil.verticalDefault(),
              _buildNameInput(),
              SpaceUtil.verticalDefault(),
              _buildEmailInput(),
              SpaceUtil.verticalDefault(),
              _buildPhoneInput(),
              SpaceUtil.verticalDefault(),
              _buildAddressInput(),
              SpaceUtil.verticalDefault(),
              _buildDescriptionInput(),
              SpaceUtil.verticalDefault(),
              _buildPersonalInfo(),
              SpaceUtil.verticalDefault(),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsername() => Text(
        'Tony Staff',
        style: Get.textTheme.headline6,
      );

  Widget _buildAvatar(BuildContext context) {
    return ButtonCustomWidget(
      boxShape: NeumorphicBoxShape.circle(),
      gradient: GradientUtil.topBottom(),
      onPressed: () {},
      height: context.width / 3,
      width: context.width / 3,
      margin: EdgeInsets.all(0),
      child: Icon(
        Icons.person,
        size: 40,
        color: ColorUtil.WHITE,
      ),
    );
  }

  Widget _buildNameInput() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: _buildFirstNameInput(),
        ),
        SpaceUtil.horizontalDefault(),
        Expanded(
          child: _buildLastNameInput(),
        ),
      ],
    );
  }

  Widget _buildLastNameInput() {
    return TextFieldCustomWidget(
      hintText: 'Last Name',
      margin: EdgeInsets.all(0),
    );
  }

  Widget _buildFirstNameInput() {
    return TextFieldCustomWidget(
      hintText: 'First Name',
      margin: EdgeInsets.all(0),
    );
  }

  Widget _buildEmailInput() {
    return TextFieldCustomWidget(
      hintText: 'Email',
      prefixIcon: FontAwesomeIcons.solidEnvelope,
      margin: EdgeInsets.all(0),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPhoneInput() {
    return TextFieldCustomWidget(
      hintText: 'Phone Number',
      prefixIcon: FontAwesomeIcons.phone,
      margin: EdgeInsets.all(0),
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildAddressInput() {
    return TextFieldCustomWidget(
      hintText: 'Address',
      prefixIcon: FontAwesomeIcons.locationArrow,
      margin: EdgeInsets.all(0),
      keyboardType: TextInputType.streetAddress,
    );
  }

  Widget _buildDescriptionInput() {
    return TextFieldCustomWidget(
      hintText: 'Description',
      prefixIcon: FontAwesomeIcons.solidCommentAlt,
      margin: EdgeInsets.all(0),
    );
  }

  Widget _buildPersonalInfo() {
    return Row(
      children: [
        Expanded(
          child: _buildBirthdayInput(),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: _buildGenderInput(),
        ),
      ],
    );
  }

  Widget _buildBirthdayInput() {
    return TextFieldCustomWidget(
      hintText: 'Birthday',
      prefixIcon: FontAwesomeIcons.calendar,
      margin: EdgeInsets.all(0),
      keyboardType: TextInputType.datetime,
    );
  }

  Widget _buildGenderInput() {
    return TextFieldCustomWidget(
      hintText: 'Gender',
      prefixIcon: FontAwesomeIcons.venusMars,
      margin: EdgeInsets.all(0),
    );
  }

  Widget _buildSaveButton() {
    return ButtonCustomWidget(
      color: Get.theme.primaryColor,
      onPressed: () {
        Get.back();
      },
      child: Text(
        'Save',
        style: Get.textTheme.button.copyWith(
          color: Get.theme.backgroundColor,
        ),
      ),
    );
  }
}
