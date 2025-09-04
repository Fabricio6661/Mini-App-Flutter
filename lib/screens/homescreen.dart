import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniappflutter/components/menu_component.dart';

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .error,
        title: Text("Home"),
      ),
      drawer:
      MenuComponent(),
        body: Center(
          child: Center(
            child: Image.asset(
              'assets/images/LOGO.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        )
    );
  }
}

