import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom/HLButtonsBoarding.dart';
import '../custom/HLTextField.dart';
import '../custom/HLTheme.dart';
import '../firestoreObjects/FbUsuario.dart';

class PerfilView extends StatelessWidget {

  FirebaseFirestore db = FirebaseFirestore.instance;
  late BuildContext _context;
  TextEditingController tecName = TextEditingController();
  TextEditingController tecAge = TextEditingController();

  Future<void> onClickAceptar() async {

    FbUsuario usuario = new FbUsuario(nombre: tecName.text, edad: int.parse(tecAge.text));

    String uidUser = FirebaseAuth.instance.currentUser!.uid;
    await db.collection("Usuarios").doc(uidUser).set(usuario.toFirestore());
    Navigator.of(_context).popAndPushNamed('/homeview');
  }

  void onClickCancelar() {
    Navigator.of(_context).popAndPushNamed('/loginview');
  }

  void onHLTextutton(int indice) {
    if(indice == 0) onClickAceptar();
    else if(indice == 1) onClickCancelar();
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
        backgroundColor: HLTheme.colorFondo,
        appBar: AppBar(
            title: Text('Perfil'),
            centerTitle: true,
            backgroundColor: HLTheme.colorPrincipal
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('resources/gatoElegante.jpg', height: 200),
              HLTextField(sLabel: 'Name', tecController: tecName, iIcon: Icon(Icons.drive_file_rename_outline_sharp)),
              HLTextField(sLabel: 'Age', tecController: tecAge, iIcon: Icon(Icons.drive_file_rename_outline_sharp)),
              HLButtonsBoarding(sText0: Text('Aceptar'), sText1: Text('Cancelar'), evento: onHLTextutton)
            ]
        )
    );
  }
}