import 'package:flutter/material.dart';

class LogoCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'STS',
      style: TextStyle(
        fontSize: 40,
        color: Colors.teal,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
