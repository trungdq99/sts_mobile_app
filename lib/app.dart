import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sts/pages/login_page.dart';
import 'package:sts/utils/route_util.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppView();
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
      home: LoginPage(),
      
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
          bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,),
          // title: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Colors.red,),
          // headline1: 
      //     headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.normal),
      // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      // bodyText2: TextStyle(fontSize: 14.0,),
        ),
      ),

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
