import 'package:flutter/material.dart';
import 'package:sts/app.dart';
import 'package:flutter/widgets.dart';
import 'repository/authentication_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final authenticationRepository = AuthenticationRepository();
  runApp(App(authenticationRepository: authenticationRepository,));
}
