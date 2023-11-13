import 'package:actividad3/main/GestionView.dart';
import 'package:actividad3/main/PostCreateView.dart';
import 'package:actividad3/main/PostView.dart';
import 'package:actividad3/onBoarding/MLoginView.dart';
import 'package:actividad3/onBoarding/PhoneLoginView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'main/MHomeView.dart';
import 'main/WHomeView.dart';
import 'onBoarding/WLoginView.dart';
import 'onBoarding/PerfilView.dart';
import 'onBoarding/RegisterView.dart';
import 'splash/SplashView.dart';

class Actividad3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    MaterialApp materialApp;

    if(kIsWeb) {
      materialApp = MaterialApp(
          title: '3PMDM',
          debugShowCheckedModeBanner: false,
          initialRoute: '/splashview',
          routes: {
            '/loginview': (context) => WLoginView(),
            '/registerview': (context) => RegisterView(),
            '/homeview': (context) => WHomeView(),
            '/splashview': (context) => SplashView(),
            '/perfilview': (context) => PerfilView(),
            '/postview': (context) => PostView(),
            '/postcreateview': (context) => PostCreateView(),
            '/gestionview': (context) => GestionView()
          }
      );
    } else {
      materialApp = MaterialApp(
          title: '3PMDM',
          debugShowCheckedModeBanner: false,
          initialRoute: '/loginview',
          routes: {
            '/loginview': (context) => MLoginView(),
            '/registerview': (context) => RegisterView(),
            '/homeview': (context) => MHomeView(),
            '/splashview': (context) => SplashView(),
            '/perfilview': (context) => PerfilView(),
            '/postview': (context) => PostView(),
            '/postcreateview': (context) => PostCreateView(),
            '/phoneloginview': (context) => PhoneLoginView()
          }
      );
    }

    return materialApp;
  }
}