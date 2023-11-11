import 'package:flutter/material.dart';

import 'HLTheme.dart';

class PostGridCellView extends StatelessWidget {

  final String sTitulo;
  final String sCuerpo;
  final double dFontSize;

  PostGridCellView({Key? key,
    required this.sTitulo,
    required this.sCuerpo,
    required this.dFontSize,
  });

  @override
  Widget build(BuildContext context) {

    return FractionallySizedBox(
        widthFactor: 0.95,
        heightFactor: 0.95,
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: HLTheme.colorPrincipal),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                    children: [
                      Text(
                          sTitulo,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: dFontSize
                          )),
                      Text(
                          sCuerpo,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: dFontSize
                          ))
                    ]
                )
            )
        )
    );
  }
}