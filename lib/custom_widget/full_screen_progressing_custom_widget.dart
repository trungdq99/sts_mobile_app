import 'package:flutter/material.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/custom_widget/progressing_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/gradient_util.dart';

class FullScreenProgressingCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Center(
        child: Container(
          height: 100,
          margin: EdgeInsets.all(20),
          child: ContainerCustomWidget(
            gradient: GradientUtil.topBottom(),
            child: ProgressingCustomWidget(
              color: ColorUtil.WHITE,
            ),
          ),
        ),
        // child: Neumorphic(
        //   style: UtilNeumorphicStyle.styleUp(
        //     radius: 20,
        //   ),
        //   margin: EdgeInsets.all(32),
        //   child: SizedBox(
        //     height: 100,
        //     child: CustomProgressing(),
        //   ),
        // ),
      ),
    );
  }
}
