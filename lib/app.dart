/*
 * Author: Trung Shin
 */

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:sts/blocs/user/user_bloc.dart';
import 'package:sts/custom_widget/notification_dialog_custom_widget.dart';
import 'package:sts/pages/splash_page.dart';
import 'package:sts/repository/user_repository.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/function_util.dart';
import 'package:sts/utils/route_util.dart';
import 'blocs/authentication/authentication_bloc.dart';
import 'cubits/internet_connection/internet_connection_cubit.dart';
import 'repository/authentication_repository.dart';

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  const App({
    Key key,
    @required this.authenticationRepository,
    @required this.userRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
              userRepository: userRepository,
            ),
          ),
          BlocProvider(
            create: (_) => InternetConnectionCubit(),
          ),
          BlocProvider(
            create: (_) => UserBloc(
              userRepository: userRepository,
              authenticationRepository: authenticationRepository,
            ),
          ),
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STS',
      onGenerateRoute: RouteUtil.onGenerateRoute,
      home: SplashPage(),
      theme: ThemeData(
        backgroundColor: ColorUtil.WHITE,
        scaffoldBackgroundColor: ColorUtil.LIGHT_BACKGROUND,
        primaryColor: ColorUtil.PRIMARY_LIGHT,
        accentColor: ColorUtil.ORANGE,
        buttonColor: ColorUtil.WHITE,
        highlightColor: ColorUtil.LIGHT_SHADOW_LIGHT_THEME,
        shadowColor: ColorUtil.DARK_SHADOW_LIGHT_THEME,
        fontFamily: 'Aileron',
        iconTheme: IconThemeData(
          color: ColorUtil.PRIMARY_LIGHT,
          size: 20,
        ),
        textTheme: TextTheme(
          button: TextStyle(
            color: ColorUtil.TEXT_COLOR_LIGHT,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: ColorUtil.TEXT_COLOR_LIGHT,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: ColorUtil.TEXT_COLOR_LIGHT,
          ),
          headline1: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            color: ColorUtil.TEXT_COLOR_LIGHT,
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorUtil.TEXT_COLOR_LIGHT,
          ),
        ),
      ),
      darkTheme: ThemeData(
        backgroundColor: ColorUtil.BLACK,
        scaffoldBackgroundColor: ColorUtil.DART_BACKGROUND,
        primaryColor: ColorUtil.PRIMARY_DARK,
        accentColor: ColorUtil.ORANGE,
        buttonColor: ColorUtil.BLACK,
        highlightColor: ColorUtil.LIGHT_SHADOW_DARK_THEME,
        shadowColor: ColorUtil.DARK_SHADOW_DARK_THEME,
        hintColor: ColorUtil.GREY,
        disabledColor: ColorUtil.GREY,
        errorColor: ColorUtil.RED,
        fontFamily: 'Aileron',
        iconTheme: IconThemeData(
          color: ColorUtil.PRIMARY_DARK,
          size: 20,
        ),
        textTheme: TextTheme(
          button: TextStyle(
            color: ColorUtil.TEXT_COLOR_DARK,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: ColorUtil.TEXT_COLOR_DARK,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: ColorUtil.TEXT_COLOR_DARK,
          ),
          headline1: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            color: ColorUtil.TEXT_COLOR_DARK,
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorUtil.TEXT_COLOR_DARK,
          ),
        ),
      ),
      builder: (context, child) {
        return Scaffold(
          body: MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  switch (state.status) {
                    case AuthenticationStatus.authenticated:
                      Get.offAllNamed(RouteUtil.MAIN);
                      break;
                    case AuthenticationStatus.unauthenticated:
                      Get.offAllNamed(RouteUtil.LOGIN);
                      break;
                    default:
                      break;
                  }
                },
              ),
              BlocListener<InternetConnectionCubit, InternetConnectionState>(
                listener: (context, state) {
                  if (state.status == InternetConnectionStatus.notConnected) {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(AuthenticationEventUnknown());
                    Get.dialog(
                      WillPopScope(
                        onWillPop: () async {
                          return false;
                        },
                        child: NotificationDialogCustomWidget(
                          text: 'No internet connection!',
                          onConfirm: () {
                            AppSettings.openWIFISettings();
                          },
                        ),
                      ),
                    ).whenComplete(() {
                      if (state.status != InternetConnectionStatus.connected) {
                        FunctionUtil.closeApp();
                      }
                    });
                  } else if (state.status ==
                          InternetConnectionStatus.connected &&
                      state.prevStatus ==
                          InternetConnectionStatus.notConnected) {
                    Get.offAllNamed(RouteUtil.SPLASH);
                  }
                },
              ),
            ],
            child: child,
          ),
        );
      },
    );
  }
}
