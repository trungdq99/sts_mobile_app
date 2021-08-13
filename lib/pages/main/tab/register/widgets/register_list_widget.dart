/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sts/cubits/cubits.dart';
import 'package:sts/pages/main/tab/register/widgets/widgets.dart';

class RegisterListWidget extends StatelessWidget {
  const RegisterListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedWeekCubit, DateTimeRange>(
      builder: (context, state) {
        return SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 100,
            ),
            children: List.generate(
                7,
                (index) => DateWidget(
                    dateTime: state.start.add(Duration(days: index)))),
          ),
        );
      },
    );
  }
}
