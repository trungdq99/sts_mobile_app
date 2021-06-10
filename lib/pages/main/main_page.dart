import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sts/cubits/selected_index_cubit.dart';
import 'package:sts/custom_widget/bottom_navigation_bar_custom_widget.dart';
import 'package:sts/custom_widget/container_custom_widget.dart';
import 'package:sts/pages/main/tab/people_page.dart';
import 'package:sts/pages/main/tab/home_page.dart';
import 'package:sts/pages/main/tab/register_page.dart';
import 'package:sts/pages/main/tab/schedule/schedule_page.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/gradient_util.dart';
import 'tab/profile_page.dart';

class MainPage extends StatelessWidget {
  // final List<BottomNavigationBarItem> _items = [
  //   BottomNavigationBarItem(
  //     icon: ContainerCustomWidget(
  //       radius: 5,
  //       margin: EdgeInsets.all(0),
  //       color: ColorUtil.WHITE,
  //       padding: EdgeInsets.all(10),
  //       child: Icon(
  //         FontAwesomeIcons.home,
  //         color: ColorUtil.BLUE,
  //         size: 20,
  //       ),
  //     ),
  //     activeIcon: ContainerCustomWidget(
  //       radius: 5,
  //       margin: EdgeInsets.all(0),
  //       padding: EdgeInsets.all(10),
  //       isUp: false,
  //       color: ColorUtil.WHITE,
  //       child: Icon(
  //         FontAwesomeIcons.home,
  //         color: ColorUtil.BLUE,
  //         size: 20,
  //       ),
  //     ),
  //     label: 'Home',
  //   ),
  //   BottomNavigationBarItem(
  //     label: 'Schedule',
  //     icon: Icon(Icons.calendar_today),
  //   ),
  //   BottomNavigationBarItem(
  //     label: 'Me',
  //     icon: Icon(Icons.person),
  //   ),
  //   BottomNavigationBarItem(
  //     label: 'Me',
  //     icon: Icon(Icons.person),
  //   ),
  //   BottomNavigationBarItem(
  //     label: 'Me',
  //     icon: Icon(Icons.person),
  //   ),
  // ];

  final SelectedIndexCubit _selectedIndexCubit = SelectedIndexCubit(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<SelectedIndexCubit, int>(
      bloc: _selectedIndexCubit,
      builder: (context, state) {
        return IndexedStack(
          children: [
            HomePage(),
            RegisterPage(),
            SchedulePage(),
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
              label: 'Trang chủ',
            ),
            BottomItem(
              icon: FontAwesomeIcons.solidNewspaper,
              label: 'Đăng ký',
            ),
            BottomItem(
              icon: FontAwesomeIcons.calendar,
              label: 'Lịch',
            ),
            BottomItem(
              icon: FontAwesomeIcons.userFriends,
              label: 'Mọi người',
            ),
            BottomItem(
              icon: FontAwesomeIcons.solidUser,
              label: 'Tài khoản',
            ),
          ],
          onIndexChanged: (value) {
            _selectedIndexCubit.emit(value);
          },
        );
        // return BottomNavigationBar(
        //   items: _items,
        //   onTap: _selectedIndexCubit.emit,
        //   currentIndex: state,
        //   backgroundColor: Colors.white,
        //   type: BottomNavigationBarType.fixed,
        //   // fixedColor: Colors.white,
        //   selectedItemColor: Get.theme.primaryColor,
        //   unselectedItemColor: Get.theme.primaryColor,
        //   selectedLabelStyle: Get.textTheme.bodyText2.copyWith(
        //     fontWeight: FontWeight.bold,
        //   ),
        //   unselectedLabelStyle: Get.textTheme.bodyText2,
        // );
      },
    );
  }
}
