import 'package:flutter/material.dart';
import 'package:to_do_list/screens/lista_tareas_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tareas (To Do List)',
      home: ListaTareas(),
    );
  }
}
