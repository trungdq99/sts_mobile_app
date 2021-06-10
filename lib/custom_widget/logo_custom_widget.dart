import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/gradient_custom_widget.dart';
import 'package:sts/utils/color_util.dart';

class LogoCustomWidget extends StatefulWidget {
  final bool isColorful;

  const LogoCustomWidget({
    Key key,
    this.isColorful: true,
  }) : super(key: key);

  @override
  _LogoCustomWidgetState createState() => _LogoCustomWidgetState();
}

class _LogoCustomWidgetState extends State<LogoCustomWidget> {
  final TextStyle _textStyle = TextStyle(
    fontSize: 60,
    color: ColorUtil.WHITE,
    fontWeight: FontWeight.bold,
    fontFamily: 'HolidaySweetLovely',
  );

  double _width = 44;

  @override
  Widget build(BuildContext context) {
    return widget.isColorful
        ? GradientCustomWidget(
            size: _width * 2,
            child: _buildLogo(),
          )
        : _buildLogo();
  }

  Widget _buildLogo() {
    return Container(
      width: _width * 3 - 20,
      height: _width * 2,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            child: Text(
              'S',
              style: Get.textTheme.headline1.copyWith(
                fontFamily: 'HolidaySweetLovely',
                color: ColorUtil.WHITE,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: _width - 20,
            child: Text(
              'T',
              style: _textStyle,
            ),
          ),
          Positioned(
            top: 20,
            left: _width * 2 - 20,
            child: Text(
              'S',
              style: _textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
