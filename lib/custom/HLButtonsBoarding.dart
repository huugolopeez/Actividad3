import 'package:flutter/material.dart';

import 'HLTheme.dart';

class HLButtonsBoarding extends StatelessWidget {

  Function(int indice)? evento;
  Widget sText0;
  Widget sText1;

  HLButtonsBoarding({Key? key,
    required this.sText0,
    required this.sText1,
    this.evento
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 150, height: 50),
              child: ElevatedButton(
                  onPressed: () => evento!(0),
                  child: sText0,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(HLTheme.colorFondo),
                      side: MaterialStateProperty.all(BorderSide(color: HLTheme.colorPrincipal)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )))
              )),
          ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 150, height: 50),
              child: ElevatedButton(
                  onPressed: () => evento!(1),
                  child: sText1,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(HLTheme.colorPrincipal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )))
              ))
        ]
    );
  }
}