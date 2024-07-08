import 'package:flutter/material.dart';
import 'login.dart'; // Importa el archivo login.dart para la navegación

class Registro extends StatelessWidget {
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
          // Contenedor para el texto "CalcIntegral"
          Container(
            padding: EdgeInsets.only(
                top:
                    100.0), // Ajusta el padding según sea necesario para el margen superior
            alignment: Alignment.topCenter,
            child: Text(
              'CalcIntegral',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Merriweather',
              ),
            ),
          ),
          // Contenedor para el formulario de registro
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Campo de nombre de usuario
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
                  SizedBox(height: 20.0),
                  // Campo de contraseña
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      icon:
                          Icon(Icons.lock, color: Colors.amber[800], size: 30),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Campo de correo electrónico (nuevo campo)
                  TextFormField(
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Correo electrónico',
                      icon:
                          Icon(Icons.email, color: Colors.amber[800], size: 30),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  // Botón de registrar en lugar de iniciar sesión
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes manejar la lógica de registro
                      // Por ahora simplemente muestra un mensaje
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Registrando...')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFFF9A826), // Color de fondo del botón
                      minimumSize:
                          Size(double.infinity, 50), // Tamaño mínimo del botón
                    ),
                    child: Text(
                      'Registrar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Merriweather',
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          30.0), // Espacio entre el botón y el texto de inicio de sesión

                  // Texto para redirigir al login
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Login()), // Redirige a la pantalla de inicio de sesión
                      );
                    },
                    child: Text(
                      '¿Ya tienes una cuenta? Inicia sesión aquí',
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
