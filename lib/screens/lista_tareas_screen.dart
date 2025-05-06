import 'package:flutter/material.dart';

class ListaTareas extends StatefulWidget {
  const ListaTareas({super.key});

  @override
  State<ListaTareas> createState() => _ListaTareasState();
}

class _ListaTareasState extends State<ListaTareas> {
  final List<Map<String, dynamic>> _tareas = [];
  final TextEditingController _controller = TextEditingController();

  void _agregarTarea(){
    if (_controller.text.isNotEmpty){
      setState(() {
        _tareas.add({'text': _controller.text, 'completed': false});
        _controller.clear();
      });
    }
  }

  void toggleTask(int index) {
    setState(() {
      _tareas[index]['completed'] = !_tareas[index]['completed'];
    });
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
        title: Text('MiwelCoding', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Tareas de Miwel', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Escribe una tarea:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(onPressed: _agregarTarea, style:ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent, foregroundColor: Colors.white), child: Text('AGREGAR', style: TextStyle(fontWeight: FontWeight.bold),))
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _tareas.length,
                itemBuilder: (context, index){
                  final tarea = _tareas[index];
                  return ListTile(
                    title: Text(
                      tarea['text'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration:
                          tarea['completed'] ? TextDecoration.lineThrough : null,
                        color: tarea['completed'] ? Colors.grey : Colors.white,
                      ),
                    ),
                    leading: IconButton(
                    icon: Icon(
                      tarea['completed']
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color:
                          tarea['completed'] ? Colors.greenAccent : Colors.white,
                      ),
                      onPressed: () => toggleTask(index),
                    ),
                    trailing: IconButton(icon: Icon(Icons.delete_outline, color: Colors.redAccent,), onPressed: () => _eliminarTarea(index)),
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