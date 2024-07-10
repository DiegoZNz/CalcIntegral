import 'package:flutter/material.dart';
import 'login.dart';
import '/servicios/database.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _email = '';
  String _profilePicture = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Image.asset(
                'assets/images/2.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                top: 50.0,
                child: Container(
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
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                    TextFormField(
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Nombre de usuario',
                        icon: Icon(Icons.person,
                            color: Colors.amber[800], size: 30),
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
                    SizedBox(height: 25.0),
                    TextFormField(
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Correo electrónico',
                        icon: Icon(Icons.email,
                            color: Colors.amber[800], size: 30),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su correo electrónico';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    SizedBox(height: 25.0),
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
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          DatabaseHelper db = DatabaseHelper();
                          await db.registerUser(
                              _username, _email, _password, _profilePicture);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Registro exitoso')),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF9A826),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Merriweather',
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}