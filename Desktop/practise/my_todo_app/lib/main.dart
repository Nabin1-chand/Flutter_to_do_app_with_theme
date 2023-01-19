import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:my_todo_app/todo_app/modal/theme_mode.dart';
import 'package:my_todo_app/todo_app/modal/todo_modal.dart';
import 'package:my_todo_app/todo_app/my_todo.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final applicatonDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(applicatonDocumentDir.path);
  Hive.registerAdapter(ToDoModalAdapter());
  await Hive.openBox<ToDoModal>('TODOS');
  await Hive.openBox('themedata');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  // static _MyAppState? of(BuildContext context) =>
  //     context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // ThemeMode _themeMode = ThemeMode.light;
  bool valueChange = false;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('themedata').listenable(),
      builder: (BuildContext context, Box box, Widget? child) {
        var darkMode = box.get('darkmode', defaultValue: false);
        return MaterialApp(
            themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            home: Scaffold(
              appBar: AppBar(
                actions: [
                  Switch(
                    value: valueChange,
                    onChanged: (value) {
                      setState(() {
                        valueChange = value;
                        box.put('darkmode', valueChange);
                      });
                    },
                  )
                ],
              ),
              body: MyTodo(),
            ));
      },
    );
  }

  // void changeTheme(ThemeMode themeMode) {
  //   setState(() {
  //     _themeMode = themeMode;
  //   });
  // }

}
