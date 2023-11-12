import 'package:actividad3/custom/HLButtonsBoarding.dart';
import 'package:actividad3/custom/HLTextField.dart';
import 'package:actividad3/singletone/DataHolder.dart';
import 'package:flutter/material.dart';

class PostCreateView extends StatelessWidget {

  late BuildContext _context;
  TextEditingController tecTitle = TextEditingController();
  TextEditingController tecBody = TextEditingController();

  void onHLButtonsBoarding(int indice) {
    if(indice == 0) {
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
             HLTextField(sLabel: 'Escribe un cuerpo', tecController: tecBody, blIsPassword: true, iIcon: const Icon(Icons.drive_file_rename_outline_sharp)),
             HLButtonsBoarding(sText0: const Text('Postear'), sText1: const Text('Cancelar'), evento: onHLButtonsBoarding)
          ])
    );
  }

}