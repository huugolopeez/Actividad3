import 'package:actividad3/singletone/DataHolder.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Text(DataHolder().selectedPost.titulo),
          Text(DataHolder().selectedPost.cuerpo)
        ]
      )
    );
  }

}