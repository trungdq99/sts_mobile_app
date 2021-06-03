import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/cubits/selected_index_cubit.dart';
import 'package:sts/pages/main/tab/schedule_page.dart';

import 'tab/info_page.dart';

class MainPage extends StatelessWidget {
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.subtitles_rounded),
      label: 'Request',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today),
      label: 'Schedule',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Info',
    ),
  ];

  final SelectedIndexCubit _selectedIndexCubit = SelectedIndexCubit(1);
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
            Center(
              child: Text('Request'),
            ),
            SchedulePage(),
            InfoPage(),
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
        return BottomNavigationBar(
            items: _items,
            onTap: _selectedIndexCubit.emit,
            currentIndex: state,
          );
      },
    );
  }
}
