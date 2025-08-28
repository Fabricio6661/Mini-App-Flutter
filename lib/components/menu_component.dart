import 'package:flutter/material.dart';
import 'package:miniappflutter/screens/homescreen.dart';
import 'package:miniappflutter/screens/sobre_screen.dart';
import 'package:miniappflutter/screens/sorteio_screen.dart';

import '../screens/login.dart';


class MenuComponent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Text("Menu",
                  style: TextStyle(color: Colors.pink, fontSize: 20),
                )
            ),
            ListTile(
              title: Text("LOGIN"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                        Login()));
              },
            ),
            ListTile(
              title: Text("HOME"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                        MyHomePage()));
              },
            ),
            ListTile(
              title: Text("SORTEIO"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                        SorteioScreen()));
              },
            ),
            ListTile(
              title: Text("SOBRE"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                        SobreScreen()));
              },
            ),

          ],
        ),
      );
  }
}