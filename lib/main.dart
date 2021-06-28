import 'package:flutter/material.dart';
import 'package:todolist_app/todolist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Center(
            child: Text(
              "To Do List",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: TodoList(),
      ),
    );
  }
}
