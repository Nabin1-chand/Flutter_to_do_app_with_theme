import 'package:authentication_jwt/api/api.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController txt = TextEditingController();
  final TextEditingController txtpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Data apidata = Data();
    return Column(
      children: [
        TextFormField(
          controller: txt,
          decoration: InputDecoration(
            hintText: "username",
          ),
        ),
        TextFormField(
          controller: txtpass,
          decoration: InputDecoration(
            hintText: "password",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              apidata.getpostApi(txt.text, txtpass.text);
            },
            child: const Text("login"))
      ],
    );
  }
}
