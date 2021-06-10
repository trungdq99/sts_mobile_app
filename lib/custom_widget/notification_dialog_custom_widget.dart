import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationDialogCustomWidget extends StatefulWidget {
  final VoidCallback onConfirm;
  final String text;
  const NotificationDialogCustomWidget({
    this.onConfirm,
    this.text: '',
  });

  @override
  _NotificationDialogCustomWidgetState createState() =>
      _NotificationDialogCustomWidgetState();
}

class _NotificationDialogCustomWidgetState
    extends State<NotificationDialogCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildContent(),
      // child: Stack(
      //   children: [
      //     _buildContent(),
      //     _buildLabel(),
      //   ],
      // ),
    );
  }

  Widget _buildContent() {
    return Container(
      // style: UtilNeumorphicStyle.styleUp(radius: 20),
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        left: 40,
        top: 20,
        right: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            widget.text,
            // style: UtilTextStyle.defaultTextStyle(
            //   color: UtilColor.ORANGE,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildConfirmButton(),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: () {
        if (widget.onConfirm != null) {
          widget.onConfirm();
        } else {
          Get.back();
        }
      },
      child: Text('Confirm'),
    );
    // return NeumorphicButton(
    //   style: UtilNeumorphicStyle.styleUp(
    //     radius: 20,
    //   ),
    //   onPressed: () async {
    //     await Future.delayed(Duration(milliseconds: 100));
    //     if (widget.onConfirm != null) {
    //       widget.onConfirm();
    //     } else {
    //       Get.back();
    //     }
    //   },
    //   padding: EdgeInsets.all(0),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       gradient: UtilGradient.topBottom(colors: UtilColor.GRADIENT_GREEN),
    //     ),
    //     alignment: Alignment.center,
    //     padding: EdgeInsets.all(10),
    //     child: CustomIconText(
    //       icon: FontAwesomeIcons.solidCheckCircle,
    //       text: 'Xác Nhận',
    //       color: UtilColor.WHITE,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    // );
  }

  // Widget _buildLabel() {
  //   return Neumorphic(
  //     style: UtilNeumorphicStyle.styleUp(radius: 20),
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 20,
  //     ),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         gradient: UtilGradient.topBottom(colors: UtilColor.GRADIENT_RED),
  //       ),
  //       padding: EdgeInsets.symmetric(
  //         horizontal: 10,
  //         vertical: 5,
  //       ),
  //       child: CustomIconText(
  //         icon: FontAwesomeIcons.solidBell,
  //         text: 'Thông Báo',
  //         textSize: H2_SIZE,
  //         fontWeight: FontWeight.bold,
  //         color: UtilColor.WHITE,
  //       ),
  //     ),
  //   );
  // }
}
