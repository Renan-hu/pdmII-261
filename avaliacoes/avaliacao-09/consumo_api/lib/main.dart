import 'package:flutter/material.dart';
import 'screens/usuarios_screen.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Consumo de API',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const UsuariosScreen(),
    );
  }
}