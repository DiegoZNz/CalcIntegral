import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:application/historial.dart';
import 'package:application/perfil.dart';

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
                      backgroundImage:
                          NetworkImage('https://placekitten.com/200/200'),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => perfil()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => historial()));
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

class _CalculatorBodyState extends State<CalculatorBody> {
  String input = '';
  String result = '';
  bool isLoading = false;

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        _calculateResult();
      } else if (buttonText == 'C') {
        input = '';
        result = '';
      } else {
        input += buttonText;
      }
    });
  }

  Future<void> _calculateResult() async {
    setState(() {
      isLoading = true;
    });

    final apiKey = '69KUT5-89KGQHGUEJ'; // Tu clave de API de Wolfram Alpha
    final query = 'integrate $input';

    try {
      final response = await http.get(
        Uri.parse(
          'https://api.wolframalpha.com/v2/query?input=${Uri.encodeComponent(query)}&format=plaintext&output=JSON&appid=$apiKey',
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final pods = data['queryresult']['pods'] as List;
        final resultPod = pods.firstWhere(
            (pod) =>
                pod['title'] == 'Definite integral' ||
                pod['title'] == 'Indefinite integral',
            orElse: () => null);

        if (resultPod != null) {
          final subpods = resultPod['subpods'] as List;
          final resultText = subpods.first['plaintext'] as String;

          setState(() {
            result = resultText;
            isLoading = false;
          });
        } else {
          setState(() {
            result = 'No se pudo calcular la integral';
            isLoading = false;
          });
        }
      } else {
        setState(() {
          result = 'Error en la solicitud';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        result = 'Error en la solicitud';
        isLoading = false;
      });
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
        isLoading
            ? CircularProgressIndicator()
            : Text(
                'Resultado: $result',
                style: TextStyle(fontSize: 24.0),
              ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('C'),
            _buildButton('('),
            _buildButton(')'),
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
            _buildButton('*'),
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
            _buildButton('0'),
            _buildButton('.'),
            _buildButton('='),
          ],
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton('x'),
            _buildButton('y'),
            _buildButton('z'),
            _buildButton('dx'),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String buttonText,
      {double height = 70.0, double minWidth = 70.0}) {
    Color buttonColor = buttonText == 'C'
        ? const Color.fromARGB(255, 249, 80, 67)
        : buttonText == '='
            ? Color(0xFFF9A826)
            : buttonText == '-' ||
                    buttonText == '+' ||
                    buttonText == '*' ||
                    buttonText == '/' ||
                    buttonText == '(' ||
                    buttonText == ')' ||
                    buttonText == 'dx'
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
          color: buttonText == 'C' || buttonText == '='
              ? Colors.white
              : Colors.black,
        ),
      ),
      onPressed: () {
        onButtonPressed(buttonText);
      },
    );
  }
}
