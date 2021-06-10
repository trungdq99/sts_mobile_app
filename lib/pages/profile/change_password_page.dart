import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/app_bar_custom_widget.dart';
import 'package:sts/custom_widget/button_custom_widget.dart';
import 'package:sts/custom_widget/text_field_custom_widget.dart';
import 'package:sts/utils/space_util.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: Text(
          'Change Password',
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
              _buildOldPasswordInput(),
              SpaceUtil.verticalDefault(),
              _buildNewPasswordInput(),
              SpaceUtil.verticalDefault(),
              _buildRePasswordInput(),
              SpaceUtil.verticalDefault(),
              _buildSaveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRePasswordInput() {
    return TextFieldCustomWidget(
      hintText: 'Nhập lại mật khẩu',
      prefixIcon: Icons.lock,
      margin: EdgeInsets.all(0),
      obscureText: true,
      maxLines: 1,
      maxLength: 20,
    );
  }

  Widget _buildNewPasswordInput() {
    return TextFieldCustomWidget(
      hintText: 'Mật khẩu mới',
      prefixIcon: Icons.lock,
      margin: EdgeInsets.all(0),
      obscureText: true,
      maxLines: 1,
      maxLength: 20,
    );
  }

  Widget _buildOldPasswordInput() {
    return TextFieldCustomWidget(
      hintText: 'Mật khẩu cũ',
      prefixIcon: Icons.lock,
      margin: EdgeInsets.all(0),
      obscureText: true,
      maxLines: 1,
      maxLength: 20,
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ButtonCustomWidget(
      color: Get.theme.primaryColor,
      onPressed: () {
        FocusScope.of(context).unfocus();
        Get.back();
      },
      child: Text(
        'Đổi mật khẩu',
        style: Get.textTheme.button.copyWith(
          color: Get.theme.backgroundColor,
        ),
      ),
    );
  }
}
