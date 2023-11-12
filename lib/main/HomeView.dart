import 'dart:io';

import 'package:actividad3/custom/HLBottomMenu.dart';
import 'package:actividad3/custom/HLDrawerClass.dart';
import 'package:actividad3/custom/HLPostCellView.dart';
import 'package:actividad3/custom/HLPostGridCellView.dart';
import 'package:actividad3/firestoreObjects/FbPost.dart';
import 'package:actividad3/onBoarding/LoginView.dart';
import 'package:actividad3/singletone/DataHolder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    getPosts();
  }

  void getPosts() async {
    CollectionReference<FbPost> reference = db.collection("Posts").withConverter(fromFirestore: FbPost.fromFirestore, toFirestore: (FbPost post, _) => post.toFirestore());
    QuerySnapshot<FbPost> querySnap = await reference.get();
    for(int i = 0 ; i < querySnap.docs.length ; i++) {
      setState(() {
        posts.add(querySnap.docs[i].data());
      });
    }
  }

  void onItemTapList(int index) {
    DataHolder().selectedPost = posts[index];
    DataHolder().saveSelectedPostInCache();
    Navigator.of(context).pushNamed('/postview');
  }

  void onItemTapDrawer(int index) {
    setState(() {
      if(index == 0) {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginView()),
            ModalRoute.withName('/loginview')
        );
      } else if(index == 1) {
        exit(0);
      }
    });
  }

  void onBottomMenuPressed(int index) {
    setState(() {
      if(index == 0) {
        bIsList = true;
      } else if(index == 1) {
        bIsList = false;
      }
    });
  }

  Widget? gridOrList(bool bIsList) {
    if(bIsList) {
      return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return HLPostCellView(
                sTitle: posts[index].titulo,
                sBody: posts[index].cuerpo,
                dFontSize: kIsWeb ? 30 : 10,
                iPosition: index,
                onItemTap: onItemTapList
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          }
      );
    } else {
      return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return HLPostGridCellView(
                sTitle: posts[index].titulo,
                sBody: posts[index].cuerpo,
                dFontSize: kIsWeb ? 30 : 10,
                iPosition: index,
                onItemTap: onItemTapList
            );
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: DataHolder().colorFondo,
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Center(
          child: gridOrList(bIsList)
      ),
      bottomNavigationBar: HLBottomMenu(evento: onBottomMenuPressed),
      drawer: HLDrawerClass(onItemTap: onItemTapDrawer),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.of(context).popAndPushNamed('/postcreateview'); },
        backgroundColor: DataHolder().colorPrincipal,
        child: const Icon(Icons.add)
      ),
    );
  }
}