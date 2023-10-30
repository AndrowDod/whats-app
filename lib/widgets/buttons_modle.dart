import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Buttons({super.key, required this.operation, required this.onpressd});

  String? operation;
  Function()? onpressd;
  @override
  Widget build(BuildContext context) {
    final theheight = MediaQuery.of(context).size.height;
    final thewidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: const Color.fromARGB(255, 52, 141, 132),
          fixedSize: Size(thewidth * 0.3, theheight * 0.05),
          textStyle: TextStyle(color: Colors.white, fontSize: thewidth * 0.05)),
      onPressed: onpressd,
      child: Text(operation!),
    );
  }
}
