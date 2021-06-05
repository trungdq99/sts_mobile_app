import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:sts/pages/add_request_page.dart';
import 'package:sts/pages/info/edit_profile_page.dart';
import 'package:sts/pages/info/job_info_page.dart';
import 'package:sts/pages/login/login_page.dart';
import 'package:sts/pages/main/main_page.dart';
import 'package:sts/pages/main/tab/info_page.dart';
import 'package:sts/pages/main/tab/schedule_page.dart';
import 'package:sts/pages/select_location/select_location_page.dart';
import 'package:sts/pages/shift_detail_page.dart';
import 'package:sts/pages/splash_page.dart';

class RouteUtil {
  static const String LOGIN = '/login';
  static const String SPLASH = '/splash';
  static const String SELECT_LOCATION = '/select_location';
  static const String MAIN = '/main';
  static const String SCHEDULE = '/schedule';
  static const String INFO = '/info';
  static const String EDIT_PROFILE = '/edit_profile';
  static const String JOB_INFO = '/job_info';
  static const String SHIFT_DETAIL = '/shift_detail';
  static const String ADD_REQUEST = '/add_request';

  // static const String
  static List<GetPage> getPage() {
    return [
      GetPage(
        name: LOGIN,
        page: () => LoginPage(),
        transition: Transition.cupertino,
      ),
      // GetPage(
      //   name: SPLASH,
      //   page: () => SplashPage(),
      //   transition: Transition.cupertino,
      // ),
      GetPage(
        name: SELECT_LOCATION,
        page: () => SelectLocationPage(),
        transition: Transition.cupertino,
      ),
    ];
  }

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
      case SCHEDULE:
        page = SchedulePage();
        break;
      case INFO:
        page = InfoPage();
        break;
      case EDIT_PROFILE:
        page = EditProfilePage();
        break;
      case JOB_INFO:
        page = JobInfoPage();
        break;
      case SHIFT_DETAIL:
        page = ShiftDetailPage();
        break;
      case ADD_REQUEST:
        page = AddRequestPage();
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
