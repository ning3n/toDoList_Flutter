import 'package:flutter/material.dart';

class ListaTareas extends StatefulWidget {
  const ListaTareas({super.key});

  @override
  State<ListaTareas> createState() => _ListaTareasState();
}

class _ListaTareasState extends State<ListaTareas> {
  final List<String> _tareas = [];
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}