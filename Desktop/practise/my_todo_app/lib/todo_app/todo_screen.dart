import "package:flutter/material.dart";
// import 'package:my_todo_app/todo_app/my_todo.dart';

class ToDOScreen extends StatefulWidget {
  final String title;
  final String description;
  const ToDOScreen({super.key, required this.title, required this.description});

  @override
  State<ToDOScreen> createState() => _ToDOScreenState();
}

class _ToDOScreenState extends State<ToDOScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(child: Text(widget.description)),
      ),
    );
  }
}
