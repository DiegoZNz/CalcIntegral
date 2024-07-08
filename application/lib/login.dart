import 'package:application/registro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo de la pantalla con la imagen
          Image.asset(
            'assets/images/2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Contenedor para el formulario de inicio de sesión
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 35.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Campos de usuario y contraseña
                  TextFormField(
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Nombre de usuario',
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber[800],
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 35.0),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      icon: Icon(Icons.lock, color: Colors.amber[800], size: 30),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  // Botón de iniciar sesión
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes manejar la lógica de inicio de sesión
                      // Por ahora simplemente muestra un mensaje
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Iniciando sesión...')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF9A826), // Color de fondo del botón
                      minimumSize: Size(double.infinity, 50), // Tamaño mínimo del botón
                    ),
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Merriweather',
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0), // Espacio entre el botón y el texto de registro

                  // Texto para redirigir al registro
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registro()), // Asegúrate de usar Registro() en lugar de registro()
                      );
                    },
                    child: Text(
                      '¿Aún no tienes una cuenta? Regístrate aquí',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.amber[900],
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
