import 'package:flutter/material.dart';

class perfil extends StatelessWidget {
    final Color secondaryColor = Color.fromRGBO(143, 148, 251, .6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('perfil'),
        backgroundColor: secondaryColor,
      ),
      body: Center(
        child: Text('Perfil Page Content'),
      ),
    );
  }
}
