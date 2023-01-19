import 'package:flutter/material.dart';
import 'package:my_todo_app/todo_app/modal/todo_modal.dart';
import 'package:my_todo_app/todo_app/my_todo.dart';

class ShowData extends StatefulWidget {
  final List<ToDoModal> item;
  const ShowData({super.key, required this.item});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Task List"),
        ),
        body: ListView.builder(
            itemCount: widget.item.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                margin: const EdgeInsets.all(50),
                height: 100,
                width: 40,
                child: Card(
                    child: Column(
                  children: [
                    Text(widget.item[index].title),
                    Text(widget.item[index].description),
                    const SizedBox(
                      width: 40,
                    ),
                    Row(
                      children: [
                        TextButton(onPressed: () {}, child: const Text("edit")),
                        const SizedBox(
                          width: 140,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {});
                              listRemove(index);
                            },
                            child: const Text("remove")),
                      ],
                    )
                  ],
                )),
              );
            }));
  }

  void listRemove(int index) {
    widget.item.removeAt(index);
  }
}
