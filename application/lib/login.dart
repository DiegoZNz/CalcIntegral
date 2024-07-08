import 'package:flutter/material.dart';
import 'registro.dart';
import '/servicios/database.dart';
import 'calculator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment
            .topCenter, // Alinea todos los widgets hacia arriba en el centro
        children: <Widget>[
          // Fondo de la pantalla con la imagen
          Image.asset(
            'assets/images/2.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Contenedor para el texto "CalcIntegral"
          Positioned(
            top: 55.0, // Ajusta la posición verticalmente
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                'CalcIntegral',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merriweather',
                ),
              ),
            ),
          ),
          // Contenedor para el formulario de inicio de sesión
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 35.0),
              child: Form(
                key: _formKey,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su nombre de usuario';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _username = value!;
                      },
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
                        icon: Icon(Icons.lock,
                            color: Colors.amber[800], size: 30),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                    SizedBox(height: 50.0),
                    // Botón de iniciar sesión
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          DatabaseHelper db = DatabaseHelper();
                          bool isAuthenticated =
                              await db.authenticateUser(_username, _password);

                          if (isAuthenticated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Inicio de sesión exitoso')),
                            );
                            // Navegar a la pantalla principal (Calculator)
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calculator()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('Usuario o contraseña incorrectos')),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFFF9A826), // Color de fondo del botón
                        minimumSize: Size(
                            double.infinity, 50), // Tamaño mínimo del botón
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
                    SizedBox(
                        height:
                            30.0), // Espacio entre el botón y el texto de registro
                    // Texto para redirigir al registro
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
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
          ),
        ],
      ),
    );
  }
}
