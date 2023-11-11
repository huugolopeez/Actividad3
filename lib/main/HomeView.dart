import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom/HLBottomMenu.dart';
import '../custom/HLDrawerClass.dart';
import '../custom/HLPostCellView.dart';
import '../custom/HLTheme.dart';
import '../custom/HLPostGridCellView.dart';
import '../firestoreObjects/FbPost.dart';
import '../onBoarding/LoginView.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FbPost> posts = [];
  bool bIsList = true;

  @override
  void initState() {
    super.initState();
    descargarPosts();
  }

  @override
  void onBottomMenuPressed(int indice) {
    setState(() {
      if(indice == 0) bIsList = true;
      else if(indice == 1) bIsList = false;
    });
  }

  void onItemTap(int indice) {
    setState(() {
      if(indice == 0) {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginView()),
            ModalRoute.withName('/loginview')
        );
      } else if(indice == 1) {
        exit(0);
      }
    });
  }

  void descargarPosts() async {
    CollectionReference<FbPost> reference = db.collection("Posts").withConverter(fromFirestore: FbPost.fromFirestore, toFirestore: (FbPost post, _) => post.toFirestore());
    QuerySnapshot<FbPost> querySnap = await reference.get();
    for(int i = 0 ; i < querySnap.docs.length ; i++) {
      setState(() {
        posts.add(querySnap.docs[i].data());
      });
    }
  }

  Widget? gridOrList(bool bIsList) {
    if(bIsList) {
      return ListView.separated(
          padding: EdgeInsets.all(20),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostCellView(sTitulo: posts[index].titulo, sCuerpo: posts[index].cuerpo, dFontSize: 30);
          },
          separatorBuilder: (context, index) {
            return Divider();
          }
      );
    } else {
      return GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostGridCellView(sTitulo: posts[index].titulo, sCuerpo: posts[index].cuerpo, dFontSize: 30);
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: HLTheme.colorFondo,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Center(
          child: gridOrList(bIsList)
      ),
      bottomNavigationBar: BottomMenu(evento: onBottomMenuPressed),
      drawer: HLDrawerClass(onItemTap: (int indice) { onItemTap(indice); }),
    );
  }
}