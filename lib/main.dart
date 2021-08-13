/*
 * Author: Trung Shin
 */

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sts/app.dart';
import 'package:flutter/widgets.dart';
import 'package:sts/blocs/blocs.dart';
import 'repository/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final UserRepository userRepository = UserRepository();
  final BrandRepository brandRepository = BrandRepository();
  final SkillsRepository skillsRepository = SkillsRepository();
  final StoresRepository storesRepository = StoresRepository();
  final authenticationRepository = AuthenticationRepository();
  final notificationBloc = NotificationBloc();
  await notificationBloc.initialize();

  runApp(BlocProvider(
    create: (context) => notificationBloc,
    child: App(
      authenticationRepository: authenticationRepository,
      userRepository: userRepository,
      brandRepository: brandRepository,
      skillRepository: skillsRepository,
      storeRepository: storesRepository,
    ),
  ));
}
