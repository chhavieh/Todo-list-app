import 'package:flutter/material.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ToDoListScreen(),
    );
  }
}

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 231, 231),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text('To-Do List',
        style: TextStyle(
          fontSize: 30
        ),
        
        ),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newTask = '';
              return AlertDialog(
                title: Text('Add Task'),
                content: TextField(
                  onChanged: (value) {
                    newTask = value;
                  },
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      setState(() {
                        tasks.add(newTask);
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
