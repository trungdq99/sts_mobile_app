import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sts/cubits/selected_index_cubit.dart';
import 'package:sts/custom_widget/bottom_navigation_bar_custom_widget.dart';
import 'package:sts/pages/main/tab/people_page.dart';
import 'package:sts/pages/main/tab/home_page.dart';
import 'package:sts/pages/main/tab/register_page.dart';
import 'package:sts/pages/main/tab/schedule/cubit/calendar_cubit.dart';
import 'package:sts/pages/main/tab/schedule/schedule_page.dart';
import 'package:sts/utils/string_util.dart';
import 'tab/profile_page.dart';

class MainPage extends StatelessWidget {
  final SelectedIndexCubit _selectedIndexCubit = SelectedIndexCubit(0);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _selectedIndexCubit,
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<SelectedIndexCubit, int>(
      bloc: _selectedIndexCubit,
      builder: (context, state) {
        return IndexedStack(
          children: [
            HomePage(),
            BlocProvider(
              create: (context) => CalendarCubit(),
              child: SchedulePage(),
            ),
            RegisterPage(),
            PeoplePage(),
            ProfilePage(),
          ],
          index: state,
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BlocBuilder<SelectedIndexCubit, int>(
      bloc: _selectedIndexCubit,
      builder: (context, state) {
        return BottomNavigationBarCustomWidget(
          listBottomItems: [
            BottomItem(
              icon: FontAwesomeIcons.home,
              label: StringUtil.HOME_LABEL,
            ),
            BottomItem(
              icon: FontAwesomeIcons.calendar,
              label: StringUtil.SCHEDULE_LABEL,
            ),
            BottomItem(
              icon: FontAwesomeIcons.newspaper,
              label: StringUtil.REGISTER_LABEL,
            ),
            BottomItem(
              icon: FontAwesomeIcons.userFriends,
              label: StringUtil.PEOPLE_LABEL,
            ),
            BottomItem(
              icon: FontAwesomeIcons.solidUser,
              label: StringUtil.PROFILE_LABEL,
            ),
          ],
          onIndexChanged: (value) {
            _selectedIndexCubit.emit(value);
          },
        );
      },
    );
  }
}
