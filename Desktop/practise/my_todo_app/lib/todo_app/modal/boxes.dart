import 'package:hive/hive.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:my_todo_app/todo_app/modal/todo_modal.dart';

class Boxes {
  static getBox() => Hive.box<ToDoModal>("TODOS");
}
