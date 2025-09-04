import 'package:flutter/material.dart';

import '../components/menu_component.dart';

class SobreScreen extends StatefulWidget {
  @override
  State<SobreScreen> createState() => _SobreState();
}

class _SobreState extends State<SobreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        title: Text("Sobre"),
      ),
      drawer: MenuComponent(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
              'assets/images/LOGO.png',
              height: 200,
            )
              ),
            SizedBox(height: 20),
            Text(
              "Calculadora dos Sonhos",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w200,
                color: Theme.of(context).shadowColor,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Fabricio Milioransa Dalanhol",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Theme.of(context).shadowColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
