import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sts/cubits/selected_index_cubit.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/gradient_util.dart';

import 'button_custom_widget.dart';

class BottomItem {
  final IconData icon;
  final String label;
  const BottomItem({
    @required this.icon,
    @required this.label,
  });
}

class BottomNavigationBarCustomWidget extends StatefulWidget {
  final List<BottomItem> listBottomItems;
  final ValueChanged<int> onIndexChanged;
  final SelectedIndexCubit controller;
  final int initIndex;

  const BottomNavigationBarCustomWidget({
    @required this.listBottomItems,
    this.onIndexChanged,
    this.controller,
    this.initIndex: 0,
  });
  @override
  _BottomNavigationBarCustomWidgetState createState() =>
      _BottomNavigationBarCustomWidgetState();
}

class _BottomNavigationBarCustomWidgetState
    extends State<BottomNavigationBarCustomWidget> {
  SelectedIndexCubit _selectIndexCubit;

  _updateIndex(int index) {
    if (widget.onIndexChanged != null) widget.onIndexChanged(index);
    _selectIndexCubit.emit(index);
  }

  @override
  void initState() {
    _selectIndexCubit =
        widget.controller ?? SelectedIndexCubit(widget.initIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectedIndexCubit>(
      create: (context) => _selectIndexCubit,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    List<Widget> items = List.generate(
      widget.listBottomItems.length,
      (index) => Expanded(
        child: _bottomItem(
          index: index,
          onPressed: _updateIndex,
          item: widget.listBottomItems[index],
        ),
      ),
    );
    return ContainerCustomWidget(
      radius: 0,
      color: ColorUtil.WHITE,
      width: context.width,
      padding: EdgeInsets.only(
        top: 5,
      ),
      // decoration: BoxDecoration(
      //   gradient: GradientUtil.bottomTop(colors: ColorUtil.GRADIENT_BLUE),
      // ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items,
        ),
      ),
    );
  }

  Widget _bottomItem({
    @required BottomItem item,
    @required ValueChanged<int> onPressed,
    @required int index,
  }) {
    return BlocBuilder<SelectedIndexCubit, int>(
      builder: (context, state) {
        return InkWell(
          onTap: () => onPressed(index),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ContainerCustomWidget(
                  // onPressed: () => onPressed(index),
                  radius: 5,
                  isUp: state != index,
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.all(5),
                  color: ColorUtil.WHITE,
                  child: Icon(
                    item.icon,
                    color: ColorUtil.BLUE,
                    size: 24,
                  ),
                ),
                Text(
                  item.label,
                  style: Get.textTheme.bodyText2.copyWith(
                    fontWeight:
                        state == index ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    // return InkWell(
    //   onTap: () => onPressed(index),
    //   child: BlocBuilder<SelectedIndexCubit, int>(
    //     builder: (context, state) {
    //       return SafeArea(
    //         child: Container(
    //           width: context.width / 3 - 40,
    //           // height: context.width / 3 - 40,
    //           margin: EdgeInsets.symmetric(vertical: 5),
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Icon(
    //                 item.icon,
    //                 color: ColorUtil.WHITE,
    //                 size: state == index ? 24 : 20,
    //               ),
    //               SizedBox(
    //                 height: 5,
    //               ),
    //               Text(
    //                 item.label,
    //                 style: TextStyle(
    //                   color: ColorUtil.WHITE,
    //                   fontSize: state == index ? 12 : 10,
    //                   fontWeight:
    //                       state == index ? FontWeight.bold : FontWeight.normal,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
