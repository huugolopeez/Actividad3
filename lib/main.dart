import 'package:actividad3/singletone/DataHolder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Actividad3.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  DataHolder().initCache();
  runApp(Actividad3());
}