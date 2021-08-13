/*
 * Author: Trung Shin
 */

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sts/custom_widget/custom_widget.dart';
import 'package:sts/models/models.dart';
import 'package:sts/utils/utils.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  FirebaseMessaging _firebaseMessaging;
  FlutterLocalNotificationsPlugin _localNotifications;
  AndroidNotificationChannel channel;
  static String notificationId = 'high_importance_channel';
  static String notificationName = 'High Importance Notifications';
  static String notificationChannelDescription =
      'This channel is used for important notifications.';

  bool _hasLaunched = false;

  NotificationBloc() : super(NotificationState()) {
    _localNotifications = FlutterLocalNotificationsPlugin();
    _firebaseMessaging = FirebaseMessaging.instance;
  }

  initialize() async {
    NotificationAppLaunchDetails _appLaunchDetails =
        await _localNotifications.getNotificationAppLaunchDetails();

    var initializationSettings = _getPlatformSettings();
    await _localNotifications.initialize(initializationSettings,
        onSelectNotification: _handleNotificationTap);

    _createNotificationChannel();
    if (Platform.isIOS) {
      var hasPermission = await _requestIOSPermissions();
      if (hasPermission) {
        await _fcmInitialization();
      } else {
        add(NotificationEventAdd());
      }
    } else {
      await _fcmInitialization();
    }

    _hasLaunched = _appLaunchDetails.didNotificationLaunchApp;
    // if (_hasLaunched) {
    //   if (_appLaunchDetails.payload != null) {
    //     _payLoad = _appLaunchDetails.payload;
    //   }
    // }
  }

  Future<bool> _requestIOSPermissions() async {
    var platformImplementation =
        _localNotifications.resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();
    bool permission = false;
    if (platformImplementation != null) {
      permission = await platformImplementation.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    return permission;
  }

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    switch (event.runtimeType) {
      case NotificationEventAdd:
        // Notification notification = Notification.fromJson(event.payload);
        // if (notification.notificationType == BindAppConstants.dayReminderType) {
        //   yield IndexedNotification(1);
        // }
        yield NotificationState(status: NotificationStatus.loading);
        yield NotificationState(status: NotificationStatus.loadingSuccess);
        break;
    }
  }

  Future<void> _showNotification(RemoteMessage message) async {
    RemoteNotification notification = message.notification;
    if (notification != null) {
      var vibrationPattern = Int64List(4);
      vibrationPattern[0] = 0;
      vibrationPattern[1] = 200;
      vibrationPattern[2] = 200;
      vibrationPattern[3] = 200;

      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channel.id,
        channel.name,
        channel.description,
        icon: 'splash',
        color: Get.theme.primaryColor,
        vibrationPattern: vibrationPattern,
        importance: Importance.max,
        priority: Priority.max,
      );
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        platformChannelSpecifics,
      );
    }
  }

  // NotificationModel convertToNotification(
  //     int notificationId, Map<String, dynamic> message) {
  //   NotificationModel notification;
  //   if (Platform.isAndroid) {
  //     notification = NotificationModel(
  //       notificationId: notificationId,
  //       notificationTitle: message['notification']['title'],
  //       notificationBody: message['notification']['body'],
  //       notificationType: message['data']['notification_type'],
  //     );
  //   } else {
  //     notification = NotificationModel(
  //       notificationId: notificationId,
  //       notificationTitle: message['aps']['alert']['title'],
  //       notificationBody: message['aps']['alert']['body'],
  //       notificationType: message['notification_type'],
  //     );
  //   }
  //   return notification;
  // }

  void _createNotificationChannel() async {
    channel = AndroidNotificationChannel(
      notificationId,
      notificationName,
      notificationChannelDescription,
      importance: Importance.high,
    );
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  _getPlatformSettings() {
    var initializationSettingsAndroid = AndroidInitializationSettings('splash');
    var initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true);
    return InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
  }

  Future _handleNotificationTap(String payload) async {
    if (payload != null) {
      print(payload);
      add(NotificationEventAdd());
      // Get.dialog(NotificationDialogCustomWidget(
      //   message: payload,
      // ));
    }
  }

  Future subcribeToTopic(String topic) async {
    _firebaseMessaging.subscribeToTopic(topic);
  }

  Future unSubcribeToTopic(String topic) async {
    _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  Future _fcmInitialization() async {
    try {
      _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      // _firebaseMessaging.subscribeToTopic('mystaff01');

      // Handle onMessage
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _showNotification(message);
        Get.dialog(NotificationDialogCustomWidget(
          title: message.notification?.title,
          message: message.notification?.body,
        ));
        add(NotificationEventAdd());
        print(
            'OnMessage: \nTitle: ${message.notification?.title}\nBody: ${message.notification?.body}');
      });

      // Handle onMessageOpenedApp
      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        print(
            'OnMessageOpenedApp: \nTitle: ${event.notification?.title}\nBody: ${event.notification?.body}');
        add(NotificationEventAdd());
        Get.dialog(NotificationDialogCustomWidget(
          title: event.notification?.title,
          message: event.notification?.body,
        ));
      });

      // Handle onBackgroundMessage
      // FirebaseMessaging.onBackgroundMessage((message) async {
      //   await Firebase.initializeApp();
      //   print(
      //       'OnBackgroundMessage: \nTitle: ${message.notification?.title}\nBody: ${message.notification?.body}');
      // });
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('NotificationBloc - _fcmInitialization: $error');
    }
  }
}
