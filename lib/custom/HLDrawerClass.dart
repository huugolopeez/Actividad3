import 'package:flutter/material.dart';

import 'HLTheme.dart';

class HLDrawerClass extends StatelessWidget {

  Function(int indice)? onItemTap;

  HLDrawerClass({Key? key,
    required this.onItemTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
        backgroundColor: HLTheme.colorFondo,
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.account_circle)
                            ),
                            Text(
                                'Nombre usuario',
                                style: TextStyle(color: Colors.white)
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(right: 10),
                              child: Text(
                                '2050 seguidores',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(
                                '2000 seguidos',
                                style: TextStyle(color: Colors.white)
                            )
                          ],
                        ),
                      )
                    ]
                )
            ),
            ListTile(
                leading: Icon(Icons.ac_unit_rounded, color: Colors.white),
                title: Text(
                  'Salir de la cuenta',
                  style: TextStyle(color: Colors.white),
                ),
                selectedColor: HLTheme.colorPrincipal,
                onTap: () { onItemTap!(0); }
            ),
            ListTile(
                leading: Icon(Icons.accessible_forward_sharp, color: Colors.white),
                title: Text(
                  'Salir de la aplicacion',
                  style: TextStyle(color: Colors.white),
                ),
                selectedColor: HLTheme.colorPrincipal,
                onTap: () { onItemTap!(1); }
            )
          ],
        )
    );
  }

}