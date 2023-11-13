import 'package:actividad3/singletone/FirebaseAdmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firestoreObjects/FbPost.dart';
import '../firestoreObjects/FbUsuario.dart';

class DataHolder {

  static final DataHolder _dataHolder = DataHolder._internal();

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAdmin fbAdmin = FirebaseAdmin();

  late Color colorFondo;
  late Color colorPrincipal;

  late FbPost selectedPost;
  late FbUsuario selectUser;

  DataHolder._internal() {
    initCache();
  }

  factory DataHolder() {
    return _dataHolder;
  }

  void initCache() {
    loadColors();
    loadCacheFbPost();
    loadCacheFbUser();
  }

  void saveSelectedPostInCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('postTitle', selectedPost.titulo);
    prefs.setString('postBody', selectedPost.cuerpo);
  }

  void saveSelectedUserInCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userName', selectUser.nombre);
    prefs.setInt('userAge', selectUser.edad);
  }

  void loadColors() {
    colorFondo = const Color.fromRGBO(38, 41, 43, 1.0);
    colorPrincipal = const Color.fromRGBO(95, 122, 219, 1.0);
  }

  void loadCacheFbUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userName = prefs.getString('userName');
    int? userAge = prefs.getInt('userAge');

    userName ??= '';
    userAge ??= 0;

    selectUser = FbUsuario(nombre: userName, edad: userAge);
  }

  void loadCacheFbPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? postTitle = prefs.getString('postTitle');
    String? postBody = prefs.getString('postBody');

    postTitle ??= '';
    postBody ??= '';

    selectedPost = FbPost(titulo: postTitle, cuerpo: postBody);
  }
}