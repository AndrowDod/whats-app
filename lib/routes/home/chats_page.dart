import 'package:flutter/material.dart';
import 'package:whats_app/models/the_chats.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key, this.email});
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: chatsList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/livechat',
                arguments: {'indix': index, 'email': email},
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(chatsList[index].imageurl),
              ),
              title: Text(
                chatsList[index].name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Hi , ${chatsList[index].name} how are you'),
              trailing: chatsList[index].id % 2 == 0
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Yesterday',
                          style: TextStyle(
                            color: Color(0xff075E55),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Color.fromARGB(255, 27, 182, 92),
                          child: Text(
                            '3',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  : const Text(
                      '9:6 am',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
            ),
          ),
        );
      },
    ));
  }
}
