import 'package:actividad3/main/PostCreateView.dart';
import 'package:actividad3/main/PostView.dart';
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
        debugShowCheckedModeBanner: false,
        initialRoute: '/splashview',
        routes: {
          '/loginview': (context) => LoginView(),
          '/registerview': (context) => RegisterView(),
          '/homeview': (context) => HomeView(),
          '/splashview': (context) => SplashView(),
          '/perfilview': (context) => PerfilView(),
          '/postview': (context) => PostView(),
          '/postcreateview': (context) => PostCreateView()
        }
    );
  }
}