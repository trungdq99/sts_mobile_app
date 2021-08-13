/*
 * Author: Trung Shin
 */

import 'package:connectivity/connectivity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'repository/api_client.dart';

const String TOKEN_KEY = 'access_token';
Connectivity connectivity = Connectivity();
ApiClient apiClient = ApiClient();

const int REQUEST_TIME_OUT = 10000; // milliseconds

const String ROLE = 'staff';

const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
