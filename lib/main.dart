/*
 * Author: Trung Shin
 */

import 'package:flutter/material.dart';
import 'package:sts/app.dart';
import 'package:flutter/widgets.dart';
import 'package:sts/repository/user_repository.dart';
import 'repository/authentication_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();
  final authenticationRepository = AuthenticationRepository();
  runApp(App(
    authenticationRepository: authenticationRepository,
    userRepository: userRepository,
  ));
}
