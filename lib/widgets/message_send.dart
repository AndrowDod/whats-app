import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageSend extends StatelessWidget {
  MessageSend({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipPath(
                clipper: UpperNipMessageClipperTwo(MessageType.send),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 25, right: 25),
                  decoration: const BoxDecoration(
                    color: Color(0xffE7FFDB),
                  ),
                  child: Text(text),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
