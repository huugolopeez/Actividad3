import 'package:actividad3/custom/HLButtonsBoarding.dart';
import 'package:actividad3/custom/HLTextField.dart';
import 'package:actividad3/firestoreObjects/FbPost.dart';
import 'package:actividad3/singletone/DataHolder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostCreateView extends StatelessWidget {

  late BuildContext _context;
  TextEditingController tecTitle = TextEditingController();
  TextEditingController tecBody = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;

  void onHLButtonsBoarding(int indice) {
    if(indice == 0) {
      FbPost newPost = FbPost(titulo: tecTitle.text, cuerpo: tecBody.text);
      CollectionReference<FbPost> postRef = db.collection('Posts').withConverter(
          fromFirestore: FbPost.fromFirestore,
          toFirestore: (FbPost post, _) => post.toFirestore()
      );
      postRef.add(newPost);
      Navigator.of(_context).popAndPushNamed('/homeview');
    } else if(indice == 1) {
      Navigator.of(_context).popAndPushNamed('/homeview');
    }
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
      backgroundColor: DataHolder().colorFondo,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             HLTextField(sLabel: 'Escribe un titulo', tecController: tecTitle, iIcon: const Icon(Icons.title)),
             HLTextField(sLabel: 'Escribe un cuerpo', tecController: tecBody, iIcon: const Icon(Icons.drive_file_rename_outline_sharp)),
             HLButtonsBoarding(sText0: const Text('Postear'), sText1: const Text('Cancelar'), evento: onHLButtonsBoarding)
          ])
    );
  }

}