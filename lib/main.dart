import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/widgets/bottom_bar.dart';

import 'package:flutter_application_1/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_application_1/features/auth/logic/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/splash/persintation/splash_screen.dart';

import 'package:flutter_application_1/firebase_options.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => AuthBloc(authRepository: AuthRepository()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
