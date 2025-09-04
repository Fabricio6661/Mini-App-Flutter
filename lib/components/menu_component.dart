import 'package:flutter/material.dart';
import 'package:miniappflutter/screens/homescreen.dart';
import 'package:miniappflutter/screens/sobre_screen.dart';
import 'package:miniappflutter/screens/Calculadora.dart';

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
              title: Text("Login"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                        Login()));
              },
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                        MyHomePage()));
              },
            ),
            ListTile(
              title: Text("Calculadora"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                        CalculadoraScreen()));
              },
            ),
            ListTile(
              title: Text("Sobre"),
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