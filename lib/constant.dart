import 'package:connectivity/connectivity.dart';

import 'repository/api_client.dart';

const String TOKEN_KEY = 'access_token';
Connectivity connectivity = Connectivity();
ApiClient apiClient = ApiClient();

const int REQUEST_TIME_OUT = 10000; // milliseconds
