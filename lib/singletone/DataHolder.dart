import 'package:flutter/material.dart';

import '../firestoreObjects/FbPost.dart';
import '../firestoreObjects/FbUsuario.dart';

class DataHolder {

  static final DataHolder _dataHolder = DataHolder._internal();

  late Color colorFondo;
  late Color colorPrincipal;

  late FbPost selectedPost;
  late FbUsuario selectUser;

  DataHolder._internal() {
    colorFondo = const Color.fromRGBO(38, 41, 43, 1.0);
    colorPrincipal = const Color.fromRGBO(95, 122, 219, 1.0);
  }

  factory DataHolder() {
    return _dataHolder;
  }
}