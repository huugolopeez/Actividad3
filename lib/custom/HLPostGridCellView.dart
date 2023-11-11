import 'package:flutter/material.dart';

import 'HLTheme.dart';

class PostGridCellView extends StatelessWidget {

  final String sTitle;
  final String sBody;
  final double dFontSize;
  final int iPosition;
  final Function(int indice)? onItemTap;

  const PostGridCellView({super.key,
    required this.sTitle,
    required this.sBody,
    required this.dFontSize,
    required this.iPosition,
    required this.onItemTap
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () { onItemTap!(iPosition); },
      child: FractionallySizedBox(
          widthFactor: 0.95,
          heightFactor: 0.95,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: HLTheme.colorPrincipal
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      children: [
                        Text(
                            sTitle,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: dFontSize
                            )),
                        Text(
                            sBody,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: dFontSize
                            ))
                      ])
              )
          )
      )
    );
  }
}