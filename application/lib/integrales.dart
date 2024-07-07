import 'package:flutter/material.dart';

class integrales extends StatelessWidget {
    final Color secondaryColor = Color.fromRGBO(143, 148, 251, .6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('integrales'),
        backgroundColor: secondaryColor,
      ),
      body: Center(
        child: Text('Integrales Content'),
      ),
    );
  }
}
