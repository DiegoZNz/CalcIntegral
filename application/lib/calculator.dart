import 'package:application/historial.dart';
import 'package:application/login.dart';
import 'package:application/perfil.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Calculator(),
    ));

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CalcIntegral'),
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
                      backgroundImage: NetworkImage(
                          'https://placekitten.com/200/200'),
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
                },
                selected: true,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => historial()));
                },
                selected: false,
                selectedTileColor: Colors.amber[300],
              ),
              // Nuevo botón de cierre de sesión
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.black),
                title: Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  // Aquí puedes agregar la lógica para cerrar sesión
                  //Navigator.pop(context);
                  // Ejemplo: Navegar a la pantalla de inicio de sesión
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                selected: false,
                selectedTileColor: Colors.amber[300],
              ),
            ],
          ),
        ),
        body: CalculatorBody(),
      ),
    );
  }
}

class CalculatorBody extends StatefulWidget {
  @override
  _CalculatorBodyState createState() => _CalculatorBodyState();
}

enum CalculatorMode { Basic, Function }

class _CalculatorBodyState extends State<CalculatorBody> {
  String input = '';
  CalculatorMode _calculatorMode = CalculatorMode.Basic;

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        input = '';
      } else if (buttonText == '←') {
        input = input.isNotEmpty ? input.substring(0, input.length - 1) : '';
      } else {
        input += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: Text(input, style: TextStyle(fontSize: 36.0)),
          ),
        ),
        _buildTopRow(),
        _calculatorMode == CalculatorMode.Basic
            ? _buildBasicKeyboard()
            : _buildFunctionKeyboard(),
      ],
    );
  }

  Widget _buildTopRow() {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(child: _buildTopButton('123', CalculatorMode.Basic)),
          Expanded(child: _buildTopButton('f(x)', CalculatorMode.Function)),
          Expanded(child: _buildButton('ABC')),
        ],
      ),
    );
  }

  Widget _buildTopButton(String text, CalculatorMode mode) {
    bool isActive = _calculatorMode == mode;
    return Container(
      margin: EdgeInsets.all(2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.amber : Colors.white,
          foregroundColor: isActive ? Colors.white : Colors.black,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(text, style: TextStyle(fontSize: 16)),
        onPressed: () {
          setState(() {
            _calculatorMode = mode;
          });
        },
      ),
    );
  }

  Widget _buildBasicKeyboard() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5, // Ajusta este valor según necesites
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1.5,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          _buildButton('7'), _buildButton('8'), _buildButton('9'), _buildButton('÷'),
          _buildButton('4'), _buildButton('5'), _buildButton('6'), _buildButton('×'),
          _buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('-'),
          _buildButton('0'), _buildButton('.'), _buildButton('='), _buildButton('+'),
          _buildButton('('), _buildButton(')'), _buildButton('C'), _buildButton('←'),
        ],
      ),
    );
  }

  Widget _buildFunctionKeyboard() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5, // Ajusta este valor según necesites
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1.5,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          _buildButton('sin'), _buildButton('cos'), _buildButton('tan'), _buildButton('∫'),
          _buildButton('ln'), _buildButton('log'), _buildButton('e^x'), _buildButton('√'),
          _buildButton('x^2'), _buildButton('x^n'), _buildButton('1/x'), _buildButton('π'),
          _buildButton('('), _buildButton(')'), _buildButton('C'), _buildButton('←'),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Container(
      margin: EdgeInsets.all(2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(buttonText, style: TextStyle(fontSize: 18)),
        ),
        onPressed: () => onButtonPressed(buttonText),
      ),
    );
  }
}