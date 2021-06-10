import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/notification_dialog_custom_widget.dart';
import 'package:sts/pages/splash_page.dart';
import 'package:sts/utils/color_util.dart';
import 'package:sts/utils/function_util.dart';
import 'package:sts/utils/route_util.dart';

import 'blocs/authentication/authentication_bloc.dart';
import 'cubits/internet_connection/internet_connection_cubit.dart';
import 'repository/authentication_repository.dart';

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;

  const App({Key key, @required this.authenticationRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (context) => InternetConnectionCubit(),
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
      themeMode: ThemeMode.light,
      // getPages: RouteUtil.getPage(),
      onGenerateRoute: RouteUtil.onGenerateRoute,
      color: Colors.teal,
      home: SplashPage(),
      theme: ThemeData(
        backgroundColor: ColorUtil.WHITE,
        scaffoldBackgroundColor: ColorUtil.WHITE,
        primaryColor: ColorUtil.BLUE,
        accentColor: ColorUtil.BLUE2,
        buttonColor: ColorUtil.WHITE,
        fontFamily: 'Aileron',
        textTheme: TextTheme(
          button: TextStyle(
            color: ColorUtil.BLUE,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: ColorUtil.BLUE,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: ColorUtil.BLUE,
          ),
          headline1: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            color: ColorUtil.BLUE,
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorUtil.BLUE,
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

      // builder: (context, child) => Scaffold(
      //   body: MultiBlocListener(listeners: [
      //     BlocListener<AuthenticationBloc, AuthenticationState>(
      //       listenWhen: (previous, current) =>
      //           previous.status != current.status,
      //       listener: (context, state) {
      //         switch (state.status) {
      //           case AuthenticationStatus.authenticated:
      //             Get.offAllNamed(UtilRoutes.MAIN);
      //             break;
      //           case AuthenticationStatus.unauthenticated:
      //             Get.offAllNamed(UtilRoutes.LOGIN);
      //             break;
      //           default:
      //             break;
      //         }
      //       },
      //     ),
      //     BlocListener<InternetConnectionCubit, InternetConnectionState>(
      //       listener: (context, state) {
      //         if (state.status == InternetConnectionStatus.notConnected) {
      //           BlocProvider.of<AuthenticationBloc>(context)
      //               .add(AuthenticationEventUnknown());
      //           Get.dialog(
      //             WillPopScope(
      //               onWillPop: () async {
      //                 return false;
      //               },
      //               child: CustomNotificationDialog(
      //                 text: UtilString.INTERNET_CONNECTION_MESSAGE,
      //                 onConfirm: () {
      //                   AppSettings.openWIFISettings();
      //                 },
      //               ),
      //             ),
      //           ).whenComplete(() {
      //             if (state.status != InternetConnectionStatus.connected) {
      //               UtilFunction.closeApp();
      //             }
      //           });
      //         } else if (state.status == InternetConnectionStatus.connected &&
      //             state.prevStatus == InternetConnectionStatus.notConnected) {
      //           Get.offAllNamed(UtilRoutes.SPLASH);
      //         }
      //       },
      //     ),
      //   ], child: child),
      // ),
    );
  }
}
