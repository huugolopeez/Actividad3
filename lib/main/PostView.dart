import 'package:actividad3/singletone/DataHolder.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: DataHolder().colorFondo,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(40, 40, 0, 20),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.account_circle)
                ),
                Text(
                  //DataHolder().selectUser.nombre.toString(),
                  'Nombre de usuario',
                  style: TextStyle(color: Colors.white)
                )
              ])
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(DataHolder().selectedPost.titulo, style: const TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(DataHolder().selectedPost.cuerpo, style: const TextStyle(color: Colors.white)),
          )
        ]
      )
    );
  }

}