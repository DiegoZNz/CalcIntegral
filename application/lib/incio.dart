import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFFF9A826), // Color de fondo
          ),
          Positioned.fill(
            child: Image.asset(
              'assets/images/1.png',
              fit: BoxFit.cover, // Ajusta la imagen al tamaño de la pantalla
            ),
          ),
          Center(
            child: Image.asset('assets/images/3.png'), // Segunda imagen centrada
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(
              'CalcIntegral',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 44,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
