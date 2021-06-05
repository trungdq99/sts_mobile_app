import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sts/pages/splash_page.dart';
import 'package:sts/utils/route_util.dart';

import 'blocs/authentication/authentication_bloc.dart';
import 'repository/authentication_repository.dart';

class App extends StatelessWidget {

  final AuthenticationRepository authenticationRepository;

  const App({Key key, @required this.authenticationRepository}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
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
        primaryColor: Colors.teal,
        accentColor: Colors.teal,
        buttonColor: Colors.teal,
        textTheme: TextTheme(
          button: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          // title: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Colors.red,),
          // headline1:
          //     headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.normal),
          // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          // bodyText2: TextStyle(fontSize: 14.0,),
        ),
      ),
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
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
          child: child,
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
