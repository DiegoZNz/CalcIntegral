import 'package:flutter/material.dart';
import 'package:application/calculator.dart';
import 'package:application/historial.dart';

class perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color(0xFFF9A826),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber[200],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage('https://placekitten.com/200/200'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Merriweather',
                          fontWeight: FontWeight.bold,
                        ),
                      ),                  
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black),
              title: Text(
                'Perfil',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Merriweather',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
              },
              selected: true,
              selectedTileColor: Colors.amber[300],
            ),
            ListTile(
              leading: Icon(Icons.calculate, color: Colors.black),
              title: Text(
                'CalcIntegral',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Merriweather',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Calculator()));
              },
              selected: false,
              selectedTileColor: Colors.amber[300],
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.black),
              title: Text(
                'Historial',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Merriweather',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => historial()));
              },
              selected: false,
              selectedTileColor: Colors.amber[300],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.0, 100.0, 16.0, 16.0), // Añade margen superior
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage('https://placekitten.com/200/200'),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // Lógica para cambiar la foto del usuario
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.amber[900],
                ),
                label: Text('Cambiar foto de perfil',
                    style: TextStyle(color: Colors.amber[800], fontSize: 18)), // Ajusta el tamaño de la fuente
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: 'Username',
                style: TextStyle(fontSize: 18), // Ajusta el tamaño de la fuente
                decoration: InputDecoration(
                  labelText: 'Nombre de usuario',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: 'correo@example.com',
                style: TextStyle(fontSize: 18), // Ajusta el tamaño de la fuente
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: 'Contraseña actual',
                obscureText: true,
                style: TextStyle(fontSize: 18), // Ajusta el tamaño de la fuente
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  // Lógica para guardar los cambios del perfil
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[800], // Color de fondo del botón
                ),
                child: Text(
                  'Guardar cambios',
                  style: TextStyle(color: Colors.white, fontSize: 18), // Ajusta el tamaño de la fuente
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: perfil(),
    ));
