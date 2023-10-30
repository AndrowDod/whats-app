import 'package:flutter/material.dart';

import '../routes/login_signup/login_screen.dart';

// ignore: must_be_immutable
class TextFieldModle extends StatelessWidget {
  TextFieldModle(
      {super.key, this.controlar, required this.name, this.ispassword = false});

  String name;
  TextEditingController? controlar;
  bool? ispassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: ispassword!,
      controller: controlar,
      onChanged: (value) {
        name == 'Email' ? email = value : password = value;
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          label: Text(
            name,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          )),
    );
  }
}
