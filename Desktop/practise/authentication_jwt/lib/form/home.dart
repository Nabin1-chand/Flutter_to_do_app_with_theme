import 'package:authentication_jwt/api/table_api.dart';
import 'package:authentication_jwt/modal/info.dart';
import 'package:authentication_jwt/table/show_data.dart';
import "package:flutter/material.dart";

import '../modal/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // UserData userData = UserData();
    // TableData tableData = TableData();
    // print(tableData.generateProductList());
    // print(userData.data);
    // List<Data> data = userData.data.map((data) => Data.fromJson(data)).toList();
    // print(data.toString());
    return Scaffold(
      // body: ListView.builder(
      //     itemCount: data.length,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text(data[index].fullname),
      //       );
      //     }));
      body: ShowData(),
    );
  }
}
