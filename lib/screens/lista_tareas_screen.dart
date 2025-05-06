import 'package:flutter/material.dart';

class ListaTareas extends StatefulWidget {
  const ListaTareas({super.key});

  @override
  State<ListaTareas> createState() => _ListaTareasState();
}

class _ListaTareasState extends State<ListaTareas> {
  final List<String> _tareas = [];
  final TextEditingController _controller = TextEditingController();

  void _agregarTarea(){
    if (_controller.text.isNotEmpty){
      setState(() {
        _tareas.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _eliminarTarea(int index){
    setState(() {
      _tareas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Escribe una tarea:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _agregarTarea, child: Text('Agregar')),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _tareas.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(_tareas[index]),
                    trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => _eliminarTarea(index))
                  );
                }
                ),
            ),
          ],
        ),
      ),
    );
  }
}