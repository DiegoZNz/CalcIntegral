import 'package:application/calculator.dart';
import 'package:application/perfil.dart';
import 'package:flutter/material.dart';

class historial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
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
                    radius: 45,
                    backgroundImage: NetworkImage('https://placekitten.com/200/200'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.bold,
                    ),
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
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => perfil()));
              },
              selected: false,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Calculator()));
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
                Navigator.pop(context); // Cierra el drawer
              },
              selected: true,
              selectedTileColor: Colors.amber[300],
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Contenido del historial'),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: historial(),
));

