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
                  // Aquí puedes implementar la navegación a la pantalla de perfil
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
                  // Aquí puedes implementar la navegación a la pantalla de historial
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

enum CalculatorMode {
  Normal,
  Integral,
}

class _CalculatorBodyState extends State<CalculatorBody> {
  String input = '';
  double result = 0.0;
  CalculatorMode _calculatorMode = CalculatorMode.Normal;

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        result = _calculateResult();
      } else if (buttonText == 'C') {
        input = '';
        result = 0.0;
      } else if (buttonText == 'Back') {
        _calculatorMode = CalculatorMode.Normal;
      } else {
        input += buttonText;
      }
    });
  }

  double _calculateResult() {
    try {
      return double.parse(input);
    } catch (e) {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(19.0),
            alignment: Alignment.centerRight,
            child: Text(
              input,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),

        // Filas de botones numéricos y operadores según el modo
        _calculatorMode == CalculatorMode.Normal
            ? _buildNormalKeyboard()
            : _buildIntegralKeyboard(),

        SizedBox(height: 15.0),
        // Botón para cambiar entre modos
        _buildSwitchModeButton(),
      ],
    );
  }

  Widget _buildNormalKeyboard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('C'),
            _buildButton('()'),
            _buildButton('%'),
            _buildButton('/'),
          ],
        ),
        SizedBox(height: 10.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
            _buildButton('x'),
          ],
        ),
        SizedBox(height: 10.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
            _buildButton('-'),
          ],
        ),
        SizedBox(height: 10.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
            _buildButton('+'),
          ],
        ),

        SizedBox(height: 10.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('∫'), // Botón de integral
            _buildButton('0'),
            _buildButton('.'),
            _buildButton('='),
          ],
        ),
        SizedBox(height: 15.0),
      ],
    );
  }

  Widget _buildIntegralKeyboard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('sin'),
            _buildButton('cos'),
            _buildButton('tan'),
            _buildButton('∫'),
          ],
        ),
        SizedBox(height: 10.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('√'),
            _buildButton('log'),
            _buildButton('ln'),
            _buildButton('e'),
          ],
        ),
        // Añade más filas según sea necesario para la calculadora de integrales
      ],
    );
  }

  Widget _buildButton(String buttonText,
      {double height = 70.0, double minWidth = 70.0}) {
    Color buttonColor = buttonText == 'C'
        ? const Color.fromARGB(255, 249, 80, 67)
        : buttonText == '=' || buttonText == '∫'
            ? Color(0xFFF9A826)
            : buttonText == '-' ||
                    buttonText == '+' ||
                    buttonText == 'x' ||
                    buttonText == '/' ||
                    buttonText == '()' ||
                    buttonText == '%'
                ? Color.fromARGB(255, 228, 225, 225)
                : Color(0xFFF0F0F0);

    return MaterialButton(
      height: height,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: buttonColor,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 24.0,
          color: buttonText == 'C' || buttonText == '=' || buttonText == '∫'
              ? Colors.white
              : Colors.black,
        ),
      ),
      onPressed: () {
        onButtonPressed(buttonText);
      },
    );
  }

  Widget _buildSwitchModeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (_calculatorMode == CalculatorMode.Normal) {
              _calculatorMode = CalculatorMode.Integral;
            } else {
              _calculatorMode = CalculatorMode.Normal;
            }
          });
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Text(
          _calculatorMode == CalculatorMode.Normal ? 'Modo Integral' : 'Modo Normal',
          style: TextStyle(fontSize: 18.0, color:Colors.amber[700]),

        ),
      ),
    );
  }
}
