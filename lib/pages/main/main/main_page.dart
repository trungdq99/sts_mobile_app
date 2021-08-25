/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sts/blocs/blocs.dart';
import 'package:sts/cubits/cubits.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/pages/main/main/cubit/main_cubit.dart';
import 'package:sts/pages/main/tab/people_page.dart';
import 'package:sts/pages/home/home_page.dart';
import 'package:sts/pages/main/tab/register/register_page.dart';
import 'package:sts/pages/main/tab/schedule/schedule_page.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';
import '../tab/profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SelectedIndexCubit _selectedIndexCubit = SelectedIndexCubit(0);
  WeekScheduleBloc _weekScheduleBloc;
  ShiftAttendanceBloc _shiftAttendanceBloc;
  ShiftAssignmentBloc _shiftAssignmentBloc;
  ShiftRegistersBloc _shiftRegistersBloc;
  WorkReportBloc _workReportBloc;
  MainCubit _mainCubit;

  @override
  void initState() {
    _weekScheduleBloc = WeekScheduleBloc(
      weekScheduleRepository: WeekScheduleRepository(),
      authenticationRepository:
          RepositoryProvider.of<AuthenticationRepository>(context),
    );
    _weekScheduleBloc.add(WeekScheduleEventGet(
        selectedWeek: DateTimeUtil.getNextWeek(DateTimeUtil.getCurDay())));

    _shiftAttendanceBloc = ShiftAttendanceBloc(
      shiftAttendanceRepository: ShiftAttendanceRepository(),
      authenticationRepository:
          RepositoryProvider.of<AuthenticationRepository>(context),
    );
    _shiftAttendanceBloc
        .add(ShiftAttendanceEventGet(selectedWeek: DateTimeUtil.getCurWeek()));

    _shiftAssignmentBloc = ShiftAssignmentBloc(
      shiftAssignmentRepository: ShiftAssignmentRepository(),
      authenticationRepository:
          RepositoryProvider.of<AuthenticationRepository>(context),
    );
    _shiftAssignmentBloc
        .add(ShiftAssignmentEventGet(selectedWeek: DateTimeUtil.getCurWeek()));

    _shiftRegistersBloc = ShiftRegistersBloc(
      shiftRegistersRepository: ShiftRegistersRepository(),
      authenticationRepository:
          RepositoryProvider.of<AuthenticationRepository>(context),
    );
    _shiftRegistersBloc.add(ShiftRegistersEventGet(
      selectedWeek: DateTimeUtil.getNextWeek(DateTimeUtil.getCurDay()),
    ));

    _workReportBloc = WorkReportBloc(
      workReportRepository: WorkReportRepository(),
      authenticationRepository:
          RepositoryProvider.of<AuthenticationRepository>(context),
    );
    _workReportBloc.add(WorkReportEventGet(
      selectedWeek: DateTimeUtil.getCurWeek(),
    ));

    _mainCubit = MainCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _mainCubit,
        ),
        BlocProvider(
          create: (context) => _selectedIndexCubit,
        ),
        BlocProvider(
          create: (context) => _shiftAssignmentBloc,
        ),
        BlocProvider(
          create: (context) => _shiftRegistersBloc,
        ),
        BlocProvider(
          create: (context) => _shiftAttendanceBloc,
        ),
        BlocProvider(
          create: (context) => _weekScheduleBloc,
        ),
        BlocProvider(
          create: (context) => _workReportBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              _mainCubit.onLoadingUserChanged(
                  state.status == UserStatus.loadingSuccessful);
              if (state.status == UserStatus.loadingFailure) {
                _mainCubit.onLoadingFailure();
              }
            },
          ),
          BlocListener<BrandBloc, BrandState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              _mainCubit.onLoadingBrandChanged(
                  state.status == BrandStatus.loadingSuccessful);
              if (state.status == BrandStatus.loadingFailure) {
                _mainCubit.onLoadingFailure();
              }
            },
          ),
          BlocListener<StoresBloc, StoresState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              _mainCubit.onLoadingStoresChanged(
                  state.status == StoresStatus.loadingSuccessful);
              if (state.status == StoresStatus.loadingFailure) {
                _mainCubit.onLoadingFailure();
              }
            },
          ),
          BlocListener<SkillsBloc, SkillsState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              _mainCubit.onLoadingSkillsChanged(
                  state.status == SkillsStatus.loadingSuccessful);
              if (state.status == SkillsStatus.loadingFailure) {
                _mainCubit.onLoadingFailure();
              }
            },
          ),
          BlocListener<NotificationBloc, NotificationState>(
            listener: (context, state) {
              if (state.status == NotificationStatus.loadingSuccess) {
                _shiftAttendanceBloc.add(ShiftAttendanceEventGet(
                    selectedWeek: DateTimeUtil.getCurWeek()));
                _shiftAssignmentBloc.add(ShiftAssignmentEventGet(
                    selectedWeek: DateTimeUtil.getCurWeek()));
                _workReportBloc.add(WorkReportEventGet(
                  selectedWeek: DateTimeUtil.getCurWeek(),
                ));
              }
            },
          ),
        ],
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            if (state.status == MainStatus.loadingSuccess) {
              return Scaffold(
                body: _buildBody(),
                bottomNavigationBar: _buildBottomNavigationBar(),
              );
            } else if (state.status == MainStatus.loadingFailure) {
              return Scaffold(
                body: NotificationDialogCustomWidget(
                  title: 'Error',
                  message: 'Something went wrong!',
                ),
              );
            } else {
              return FullScreenProgressingCustomWidget();
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<SelectedIndexCubit, int>(
      builder: (context, state) {
        return IndexedStack(
          children: [
            HomePage(),
            BlocProvider(
              create: (context) => SelectedWeekCubit(),
              child: SchedulePage(),
            ),
            BlocProvider(
              create: (context) => SelectedWeekCubit()..moveNextWeek(),
              child: RegisterPage(),
            ),
            // PeoplePage(),
            ProfilePage(),
          ],
          index: state,
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BlocBuilder<SelectedIndexCubit, int>(
      builder: (context, state) {
        return BottomNavigationBarCustomWidget(
          controller: _selectedIndexCubit,
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
            // BottomItem(
            //   icon: FontAwesomeIcons.userFriends,
            //   label: StringUtil.PEOPLE_LABEL,
            // ),
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
