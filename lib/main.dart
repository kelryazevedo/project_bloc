import 'package:flutter/material.dart';
import 'package:project_bloc/screen/buscaCep/cep_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CepScreen() //HomeScreen(title: 'Utilizando Bloc'),
        );
  }
}
