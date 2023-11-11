import 'package:flutter/material.dart';

import 'main/HomeView.dart';
import 'onBoarding/LoginView.dart';
import 'onBoarding/PerfilView.dart';
import 'onBoarding/RegisterView.dart';
import 'splash/SplashView.dart';

class Actividad3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: '3PMDM',
        routes: {
          '/loginview': (context) => LoginView(),
          '/registerview': (context) => RegisterView(),
          '/homeview': (context) => HomeView(),
          '/splashview': (context) => SplashView(),
          '/perfilview': (context) => PerfilView()
        },
        initialRoute: '/splashview',
        debugShowCheckedModeBanner: false
    );
  }
}