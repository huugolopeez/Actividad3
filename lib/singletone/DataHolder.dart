import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firestoreObjects/FbPost.dart';
import '../firestoreObjects/FbUsuario.dart';

class DataHolder {

  static final DataHolder _dataHolder = DataHolder._internal();

  FirebaseFirestore db = FirebaseFirestore.instance;

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
  }

  void insertPost(FbPost post) {
    CollectionReference<FbPost> postRef = db.collection('Posts').withConverter(
        fromFirestore: FbPost.fromFirestore,
        toFirestore: (FbPost post, _) => post.toFirestore()
    );

    postRef.add(post);
  }

  void saveSelectedPostInCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('postTitle', selectedPost.titulo);
    prefs.setString('postBody', selectedPost.cuerpo);
  }

  void loadColors() {
    colorFondo = const Color.fromRGBO(38, 41, 43, 1.0);
    colorPrincipal = const Color.fromRGBO(95, 122, 219, 1.0);
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