/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';

class LogoCustomWidget extends StatelessWidget {
  final bool isColorful;
  const LogoCustomWidget({
    this.isColorful: true,
  });

  @override
  Widget build(BuildContext context) {
    String src = isColorful
        ? 'assets/images/logo_color_transparent.png'
        : 'assets/images/logo_white_transparent.png';
    return Image.asset(
      src,
      height: 150,
      width: 150,
    );
  }
}
