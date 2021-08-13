/*
 * Author: Trung Shin
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sts/cubits/cubits.dart';
import 'custom_widget.dart';

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
      color: Get.theme.backgroundColor,
      margin: EdgeInsets.all(0),
      width: context.width,
      padding: EdgeInsets.only(
        top: 5,
      ),
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
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtonCustomWidget(
                onPressed: () => onPressed(index),
                isDelay: false,
                radius: 5,
                isUp: state != index,
                width: 40,
                height: 40,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(0),
                color: Get.theme.backgroundColor,
                child: Icon(
                  item.icon,
                  color: state != index
                      ? Get.theme.primaryColor
                      : Get.theme.accentColor,
                ),
              ),
              Text(
                item.label,
                style: Get.textTheme.bodyText2.copyWith(
                  fontWeight:
                      state == index ? FontWeight.bold : FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
