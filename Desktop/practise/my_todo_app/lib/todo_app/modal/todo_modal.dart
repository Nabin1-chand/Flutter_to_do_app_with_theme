import 'package:hive/hive.dart';
part 'todo_modal.g.dart';

@HiveType(typeId: 0)
class ToDoModal {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;

  ToDoModal(this.title, this.description);
}
