import 'package:flutter/material.dart';
import 'package:sts/custom_widget/back_button_custom_widget.dart';

class AppBarCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget title;
  final bool showBackButton;
  final bool isFullscreenDialog;

  const AppBarCustomWidget({
    this.title,
    this.showBackButton: false,
    this.isFullscreenDialog: false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            showBackButton
                ? Positioned(
                    left: 0,
                    child: BackButtonCustomWidget(
                      isFullscreenDialog: isFullscreenDialog,
                    ),
                  )
                : SizedBox(),
            Center(child: title),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
