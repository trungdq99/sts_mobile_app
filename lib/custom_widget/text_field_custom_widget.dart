/*
 * Author: Trung Shin
 */

import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/utils/utils.dart';

import 'custom_widget.dart';

class TextFieldCustomWidget extends StatefulWidget {
  final TextEditingController controller;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final String hintText;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final int maxLength;
  final bool enable;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final bool isNotEmpty;
  final TextAlign textAlign;
  final bool autoFocus;
  final double radius;
  final NeumorphicBoxShape boxShape;
  final int minLines;
  final int maxLines;
  final String errorText;
  final bool showError;

  TextFieldCustomWidget({
    this.controller,
    this.prefixIcon,
    this.keyboardType: TextInputType.text,
    this.hintText: '',
    this.margin: const EdgeInsets.all(20),
    this.padding: const EdgeInsets.all(0),
    this.maxLength,
    this.enable: true,
    this.onChanged,
    this.obscureText: false,
    this.isNotEmpty: false,
    this.textAlign: TextAlign.center,
    this.autoFocus: false,
    this.radius: 20,
    this.boxShape,
    this.minLines,
    this.maxLines,
    this.errorText: '',
    this.showError: false,
  });
  @override
  _TextFieldCustomWidgetState createState() => _TextFieldCustomWidgetState();
}

class _TextFieldCustomWidgetState extends State<TextFieldCustomWidget> {
  bool _isEditing;
  TextEditingController _controller;
  @override
  void initState() {
    _isEditing = false;
    _controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FocusScope(
          onFocusChange: (value) {
            if (widget.enable) {
              setState(() {
                _isEditing = value;
              });
            }
          },
          child: ContainerCustomWidget(
            radius: widget.radius,
            boxShape: widget.boxShape,
            color: Get.theme.backgroundColor,
            isUp: !_isEditing || !widget.enable,
            margin: widget.margin,
            padding: widget.padding,
            child: Stack(
              children: [
                widget.prefixIcon != null
                    ? Padding(
                        padding: EdgeInsets.all(12.0),
                        child: FaIcon(
                          widget.prefixIcon,
                          size: 24,
                          color: _isEditing
                              ? Get.theme.primaryColor
                              : Get.theme.hintColor,
                        ),
                      )
                    : SizedBox(),
                TextField(
                  autofocus: widget.autoFocus,
                  enabled: widget.enable,
                  controller: _controller,
                  onChanged: (value) {
                    if (widget.onChanged != null) widget.onChanged(value);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: Get.textTheme.bodyText1.copyWith(
                      color: Get.theme.hintColor,
                    ),
                    counterText: '',
                    contentPadding: widget.prefixIcon != null
                        ? EdgeInsets.only(
                            left: 40,
                            right: 10,
                          )
                        : EdgeInsets.all(0),
                  ),
                  textAlign: widget.textAlign,
                  style: Get.textTheme.bodyText1.copyWith(
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLength: widget.maxLength,
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  keyboardType: widget.keyboardType,
                  cursorColor: Get.theme.primaryColor,
                  obscureText: widget.obscureText,
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: widget.margin,
          height: SpaceUtil.SPACE_DEFAULT,
          child: widget.errorText != null && widget.errorText.isNotEmpty
              ? Text(
                  widget.errorText,
                  style: Get.textTheme.bodyText2.copyWith(
                    color: Get.theme.errorColor,
                    fontStyle: FontStyle.italic,
                  ),
                )
              : SizedBox(),
        ),
      ],
    );
  }
}
