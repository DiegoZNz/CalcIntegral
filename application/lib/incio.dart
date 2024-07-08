import 'dart:async'; // Importa este paquete para usar Future y Timer

import 'package:flutter/material.dart';
import 'calculator.dart'; // Asegúrate de importar el archivo login.dart correctamente

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
    // Aquí usamos un StatefulWidget para poder iniciar el temporizador
    return Scaffold(
      body: _SplashScreen(), // Usa un widget separado para la pantalla de presentación
    );
  }
}

class _SplashScreen extends StatefulWidget {
  @override
  __SplashScreenState createState() => __SplashScreenState();
}

class __SplashScreenState extends State<_SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Utiliza Future.delayed para esperar 8 segundos antes de navegar a la siguiente pantalla
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Calculator()), // Reemplaza LoginScreen con el nombre correcto de tu clase de pantalla de login
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
