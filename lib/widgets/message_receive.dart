import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class MessageReceive extends StatelessWidget {
  MessageReceive({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: UpperNipMessageClipperTwo(MessageType.receive),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 25, right: 25),
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
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
