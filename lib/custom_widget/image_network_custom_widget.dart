/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/progressing_custom_widget.dart';
import 'package:sts/utils/gradient_util.dart';

class ImageNetworkCustomWidget extends StatefulWidget {
  final double height;
  final double width;
  final String imgUrl;
  const ImageNetworkCustomWidget({
    @required this.imgUrl,
    this.width,
    this.height,
  });
  @override
  _ImageNetworkCustomWidgetState createState() =>
      _ImageNetworkCustomWidgetState();
}

class _ImageNetworkCustomWidgetState extends State<ImageNetworkCustomWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.imgUrl != null && widget.imgUrl.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: widget.imgUrl ?? '',
        placeholder: (context, url) => Center(
          child: ProgressingCustomWidget(
            color: Get.theme.backgroundColor,
            circleSize: 20,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(gradient: GradientUtil.topBottom()),
          child: Icon(
            FontAwesomeIcons.image,
            color: Get.theme.backgroundColor,
            size: 20,
          ),
        ),
        // fit: BoxFit.cover,
        height: widget.height,
        width: widget.width,
        filterQuality: FilterQuality.high,
      );
    } else {
      return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(gradient: GradientUtil.topBottom()),
        child: Icon(
          FontAwesomeIcons.image,
          color: Get.theme.backgroundColor,
          size: 20,
        ),
      );
    }
  }
}
