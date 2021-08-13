/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:sts/pages/add_request_page.dart';
import 'package:sts/pages/login/login_page.dart';
import 'package:sts/pages/main/main/main_page.dart';
import 'package:sts/pages/main/tab/people_page.dart';
import 'package:sts/pages/home/home_page.dart';
import 'package:sts/pages/main/tab/profile_page.dart';
import 'package:sts/pages/main/tab/register/register_page.dart';
import 'package:sts/pages/main/tab/schedule/schedule_page.dart';
import 'package:sts/pages/profile/change_password_page.dart';
import 'package:sts/pages/profile/edit_profile_page.dart';
import 'package:sts/pages/profile/job_info_page.dart';
import 'package:sts/pages/select_location/select_location_page.dart';
import 'package:sts/pages/shift_detail_page.dart';
import 'package:sts/pages/splash_page.dart';
import 'package:sts/pages/attendance/attendance_page.dart';
import 'package:sts/pages/work_report/work_report_page.dart';

class RouteUtil {
  static const String LOGIN = '/login';
  static const String SPLASH = '/splash';
  static const String SELECT_LOCATION = '/select_location';
  static const String MAIN = '/main';
  static const String HOME = 'home';
  static const String REGISTER = '/register';
  static const String SCHEDULE = '/schedule';
  static const String PEOPLE = '/people';
  static const String PROFILE = '/profile';
  static const String EDIT_PROFILE = '/edit_profile';
  static const String JOB_INFO = '/job_info';
  static const String CHANGE_PASSWORD = '/change_password';
  static const String SHIFT_DETAIL = '/shift_detail';
  static const String ADD_REQUEST = '/add_request';
  static const String ATTENDANCE = '/attendance';
  static const String WORK_REPORT = '/work_report';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page;
    bool fullscreenDialog = false;
    switch (settings.name) {
      case LOGIN:
        page = LoginPage();
        break;
      case SPLASH:
        page = SplashPage();
        break;
      case SELECT_LOCATION:
        page = SelectLocationPage();
        fullscreenDialog = true;
        break;
      case MAIN:
        page = MainPage();
        break;
      case HOME:
        page = HomePage();
        break;
      case REGISTER:
        page = RegisterPage();
        break;
      case SCHEDULE:
        page = SchedulePage();
        break;
      case PEOPLE:
        page = PeoplePage();
        break;
      case PROFILE:
        page = ProfilePage();
        break;
      case EDIT_PROFILE:
        page = EditProfilePage();
        break;
      case JOB_INFO:
        page = JobInfoPage();
        break;
      case CHANGE_PASSWORD:
        page = ChangePasswordPage();
        break;
      case SHIFT_DETAIL:
        page = ShiftDetailPage(
          shiftAssignmentModel: settings.arguments,
        );
        break;
      case ADD_REQUEST:
        page = AddRequestPage();
        break;
      case ATTENDANCE:
        page = AttendancePage(
          shiftAttendanceBloc: settings.arguments,
        );
        break;
      case WORK_REPORT:
        page = WorkReportPage(
          shiftAssignmentBloc: settings.arguments,
        );
        break;
      default:
        page = Scaffold(
          body: Center(
            child: Text('Page Not found!'),
          ),
        );
        break;
    }
    return GetPageRoute(
      page: () => page,
      transition: Transition.cupertino,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
