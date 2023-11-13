import 'dart:io';

import 'package:actividad3/custom/HLButtonsBoarding.dart';
import 'package:actividad3/custom/HLTextField.dart';
import 'package:actividad3/firestoreObjects/FbPost.dart';
import 'package:actividad3/singletone/DataHolder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostCreateView extends StatefulWidget {

  @override
  State<PostCreateView> createState() => _PostCreateViewState();
}

class _PostCreateViewState extends State<PostCreateView> {

  TextEditingController tecTitle = TextEditingController();
  TextEditingController tecBody = TextEditingController();

  ImagePicker _picker = ImagePicker();
  File _imagenPreview = File('');

  void onHLButtonsBoarding(int index) async {
    if(index == 0) {
      final storageRef = FirebaseStorage.instance.ref();
      String rutaEnNube = 'posts/${FirebaseAuth.instance.currentUser!.uid}imgs/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final rutaAFicheroEnNube = storageRef.child(rutaEnNube);
      final metadata = SettableMetadata(contentType: 'image/jpeg');

      try {
        await rutaAFicheroEnNube.putFile(_imagenPreview, metadata);
      } on FirebaseException catch (e) {
        print('Error al subir la imagen');
      }

      String imgUrl = await rutaAFicheroEnNube.getDownloadURL();
      DataHolder().fbAdmin.insertPost(FbPost(titulo: tecTitle.text, cuerpo: tecBody.text, imagen: imgUrl));

      Navigator.of(context).popAndPushNamed('/homeview');
    } else if(index == 1) {
      Navigator.of(context).popAndPushNamed('/homeview');
    }
  }

  void onCameraButton() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _imagenPreview = File(image.path);
      });
    }
  }

  void onGalleryButton() async {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if(image != null) {
        setState(() {
          _imagenPreview = File(image.path);
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DataHolder().colorFondo,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HLTextField(sLabel: 'Escribe un titulo', tecController: tecTitle, iIcon: const Icon(Icons.title)),
              HLTextField(sLabel: 'Escribe un cuerpo', tecController: tecBody, iIcon: const Icon(Icons.drive_file_rename_outline_sharp)),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () { onCameraButton(); },
                          child: Icon(Icons.camera_alt_rounded, color: DataHolder().colorPrincipal)
                      ),
                      TextButton(
                          onPressed: () { onGalleryButton(); },
                          child: Icon(Icons.image, color: DataHolder().colorPrincipal)
                      ),
                    ]),
              ),
              HLButtonsBoarding(sText0: const Text('Postear'), sText1: const Text('Cancelar'), evento: onHLButtonsBoarding)
            ])
    );
  }
}