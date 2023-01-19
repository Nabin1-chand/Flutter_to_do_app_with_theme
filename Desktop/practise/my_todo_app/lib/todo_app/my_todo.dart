import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:my_todo_app/todo_app/modal/boxes.dart';

import 'package:my_todo_app/todo_app/modal/todo_modal.dart';
import 'package:my_todo_app/todo_app/todo_screen.dart';

import '../main.dart';

class MyTodo extends StatefulWidget {
  const MyTodo({
    super.key,
  });

  @override
  State<MyTodo> createState() => _MyTodoState();
}

class _MyTodoState extends State<MyTodo> {
  List<Map<String, dynamic>> todoItem = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(214, 32, 74, 75),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _buildDialouge(context),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Center(child: Text("Your Daily Activities")),
        // backgroundColor: const Color.fromARGB(193, 243, 201, 64),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [
          Switch(
              value: checkValue,
              onChanged: (newValue) {
                setState(() {
                  checkValue = newValue;
                  if (checkValue)
                    MyApp.of(context)!.changeTheme(ThemeMode.dark);
                  else
                    MyApp.of(context)!.changeTheme(ThemeMode.light);
                });
              })
        ],
      ),
      body: Boxes.getBox().isEmpty
          ? const Center(
              child: Text(
              'No task were added ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ))
          : Container(
              margin: const EdgeInsets.fromLTRB(10, 100, 10, 10),
              child: ValueListenableBuilder(
                valueListenable: Hive.box<ToDoModal>("TODOS").listenable(),
                builder: (context, Box<ToDoModal> notesBox, _) {
                  return ListView.builder(
                      itemCount: notesBox.values.length,
                      itemBuilder: (context, index) {
                        var datas = notesBox.values.toList().cast<ToDoModal>();
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ToDOScreen(
                                        title: datas[index].title,
                                        description:
                                            datas[index].description))));
                          },
                          child: Card(
                              color: Color.fromARGB(255, 191, 221, 151),
                              elevation: 0,
                              child: Slidable(
                                endActionPane: ActionPane(
                                    motion: const StretchMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: ((context) {
                                          _editDialouge(
                                              index,
                                              datas[index].title,
                                              datas[index].description);
                                        }),
                                        backgroundColor:
                                            const Color(0xFF21B7CA),
                                        foregroundColor: Colors.white,
                                        icon: Icons.edit,
                                        label: 'edit',
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      SlidableAction(
                                        onPressed: ((context) {
                                          _delete(index);
                                          setState(() {});
                                        }),
                                        backgroundColor:
                                            const Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'delete',
                                      ),
                                    ]),
                                child: ListTile(
                                  hoverColor:
                                      const Color.fromARGB(255, 66, 114, 138),
                                  title: Text(
                                    datas[index].title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  subtitle: Text(
                                    datas[index].description,
                                    style: const TextStyle(
                                        fontSize: 20, letterSpacing: 1),
                                  ),
                                ),
                              )),
                        );
                      });
                },
              ),
            ),
    ));
  }

  _buildDialouge(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        validator: (value) =>
                            value!.isEmpty ? "please fill title" : null,
                        decoration: const InputDecoration(
                          hintText: "Title",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        validator: (value) =>
                            value!.isEmpty ? "please fill description" : null,
                        decoration: const InputDecoration(
                          hintText: "Description",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () async {
                            if (titleController.text.isNotEmpty &&
                                descriptionController.text.isNotEmpty) {
                              var box = Boxes.getBox();

                              var data = ToDoModal(titleController.text,
                                  descriptionController.text);

                              box.add(data);
                              titleController.clear();
                              descriptionController.clear();
                              Navigator.pop(context);
                            } else {
                              _formKey.currentState!.validate();
                            }
                          },
                          child: const Text("Add")),
                      TextButton(
                          onPressed: () {
                            titleController.clear();
                            descriptionController.clear();
                            Navigator.pop(context);
                          },
                          child: Text("cancel")),
                    ],
                  ))
            ],
          );
        });
  }

  void deleteItem(int index) {
    Boxes.getBox().deleteAt(index);
  }

  _delete(index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove the item?'),
            actions: [
              TextButton(
                  onPressed: () {
                    // Boxes.getBox().deleteAt(index);
                    deleteItem(index);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  _editDialouge(int index, String title, String description) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          titleController.text = title;
          descriptionController.text = description;
          return AlertDialog(
            actions: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter title";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Title",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please add description";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Description",
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () async {
                            if (titleController.text.isNotEmpty ||
                                descriptionController.text.isNotEmpty) {
                              setState(() {});
                              Boxes.getBox().putAt(
                                  index,
                                  ToDoModal(titleController.text,
                                      descriptionController.text));
                              Navigator.pop(context);
                              titleController.clear();
                              descriptionController.clear();

                              //  titleController.clear();
                              //   descriptionController.clear();
                              // print("kkkk");
                            } else {
                              _formKey.currentState!.validate();
                            }
                            // print("no data modified");

                            // print(todoItem.toString());
                          },
                          child: const Text("Edit")),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("cancel"))
                    ],
                  ))
            ],
          );
        });
  }
}
