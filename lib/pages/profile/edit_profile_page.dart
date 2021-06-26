/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/user/user_bloc.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/full_screen_progressing_custom_widget.dart';
import 'package:sts/custom_widget/icon_text_custom_widget.dart';
import 'package:sts/custom_widget/image_network_custom_widget.dart';
import 'package:sts/custom_widget/notification_dialog_custom_widget.dart';
import 'package:sts/custom_widget/text_field_custom_widget.dart';
import 'package:sts/models/user_model.dart';
import 'package:sts/utils/gradient_util.dart';
import 'package:sts/utils/space_util.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserModel _userModel;
  UserBloc _userBloc;

  @override
  void initState() {
    _userModel = UserModel.empty;
    _userBloc = BlocProvider.of<UserBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.status == UserStatus.loadingSuccessful ||
            state.status == UserStatus.loadingFailure) {
          Get.dialog(NotificationDialogCustomWidget(
            text: state.message,
          ));
        }
      },
      builder: (context, state) {
        if (state.status == UserStatus.loadingSuccessful &&
            _userModel == UserModel.empty) {
          _userModel = state.userModel;
        }
        return Stack(
          children: [
            Scaffold(
              appBar: AppBarCustomWidget(
                title: Text(
                  'Edit Profile',
                  style: Get.textTheme.headline6,
                ),
                showBackButton: true,
                showCheckButton: true,
                onCheckButtonPressed: _userModel != state.userModel
                    ? () {
                        _userBloc.add(UserEventUpdate(userModel: _userModel));
                      }
                    : null,
              ),
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildAvatar(),
                      SpaceUtil.verticalDefault(),
                      _buildNameInput(),
                      SpaceUtil.verticalDefault(),
                      _buildEmailInput(),
                      SpaceUtil.verticalDefault(),
                      _buildPhoneInput(),
                      SpaceUtil.verticalDefault(),
                      _buildAddressInput(),
                      // SpaceUtil.verticalDefault(),
                      // _buildDescriptionInput(),
                      SpaceUtil.verticalDefault(),
                      _buildPersonalInfo(),
                      SpaceUtil.verticalDefault(),
                      _buildSaveButton(),
                    ],
                  ),
                ),
              ),
            ),
            state.status == UserStatus.loading
                ? FullScreenProgressingCustomWidget()
                : SizedBox(),
          ],
        );
      },
    );
  }

  Widget _buildAvatar() {
    return ButtonCustomWidget(
      boxShape: NeumorphicBoxShape.circle(),
      gradient: GradientUtil.topBottom(),
      onPressed: () {},
      height: Get.width / 3,
      width: Get.width / 3,
      margin: EdgeInsets.all(0),
      child: ImageNetworkCustomWidget(
        imgUrl: _userModel.photoUrl,
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
        controller: TextEditingController(text: _userModel.lastName),
        onChanged: (value) {
          _userModel = _userModel.copyWith(lastName: value);
        });
  }

  Widget _buildFirstNameInput() {
    return TextFieldCustomWidget(
      hintText: 'First Name',
      margin: EdgeInsets.all(0),
      controller: TextEditingController(text: _userModel.firstName),
      onChanged: (value) {
        _userModel = _userModel.copyWith(firstName: value);
      },
    );
  }

  Widget _buildEmailInput() {
    return TextFieldCustomWidget(
      hintText: 'Email',
      prefixIcon: FontAwesomeIcons.solidEnvelope,
      margin: EdgeInsets.all(0),
      keyboardType: TextInputType.emailAddress,
      controller: TextEditingController(text: _userModel.email),
      onChanged: (value) {
        _userModel = _userModel.copyWith(email: value);
      },
    );
  }

  Widget _buildPhoneInput() {
    return TextFieldCustomWidget(
      hintText: 'Phone Number',
      prefixIcon: FontAwesomeIcons.phone,
      margin: EdgeInsets.all(0),
      keyboardType: TextInputType.phone,
      controller: TextEditingController(text: _userModel.phone),
      onChanged: (value) {
        _userModel = _userModel.copyWith(phone: value);
      },
    );
  }

  Widget _buildAddressInput() {
    return TextFieldCustomWidget(
      hintText: 'Address',
      prefixIcon: FontAwesomeIcons.locationArrow,
      margin: EdgeInsets.all(0),
      keyboardType: TextInputType.streetAddress,
      controller: TextEditingController(text: _userModel.address),
      onChanged: (value) {
        _userModel = _userModel.copyWith(address: value);
      },
    );
  }

  // Widget _buildDescriptionInput() {
  //   return TextFieldCustomWidget(
  //     hintText: 'Description',
  //     prefixIcon: FontAwesomeIcons.solidCommentAlt,
  //     margin: EdgeInsets.all(0),
  //   );
  // }

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
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      onPressed: () {},
      alignment: Alignment.centerLeft,
      child: IconTextCustomWidget(
        icon: FontAwesomeIcons.calendar,
        text: '${_userModel.dob}',
        backgroundIconColor: Get.theme.primaryColor,
        iconColor: Get.theme.backgroundColor,
        textStyle: Get.textTheme.button,
      ),
    );
  }

  Widget _buildGenderInput() {
    return ButtonCustomWidget(
      margin: EdgeInsets.all(0),
      onPressed: () {},
      alignment: Alignment.centerLeft,
      child: IconTextCustomWidget(
        icon: FontAwesomeIcons.venusMars,
        text: '${_userModel.gender}',
        backgroundIconColor: Get.theme.accentColor,
        iconColor: Get.theme.backgroundColor,
        textStyle: Get.textTheme.button,
      ),
    );
  }

  Widget _buildSaveButton() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return ButtonCustomWidget(
          color: Get.theme.primaryColor,
          onPressed: state.userModel != _userModel
              ? () {
                  _userBloc.add(UserEventUpdate(userModel: _userModel));
                }
              : null,
          child: Text(
            'Save',
            style: Get.textTheme.button.copyWith(
              color: Get.theme.backgroundColor,
            ),
          ),
        );
      },
    );
  }
}
