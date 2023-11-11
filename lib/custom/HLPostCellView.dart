import 'package:flutter/material.dart';

import 'HLTheme.dart';

class PostCellView extends StatelessWidget {

  final String sTitulo;
  final String sCuerpo;
  final double dFontSize;

  PostCellView({Key? key,
    required this.sTitulo,
    required this.sCuerpo,
    required this.dFontSize
  });

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: HLTheme.colorPrincipal),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                children: [
                  Text(
                      sTitulo,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: dFontSize
                      )),
                  Text(
                      sCuerpo,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: dFontSize
                      ))
                ]
            )
        )
    );
  }
}