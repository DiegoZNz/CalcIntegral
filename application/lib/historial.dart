import 'package:flutter/material.dart';

class historial extends StatelessWidget {
    final Color secondaryColor = Color.fromRGBO(143, 148, 251, .6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('historial'),
        backgroundColor: secondaryColor,
      ),
      body: Center(
        child: Text('historial Content'),
      ),
    );
  }
}
