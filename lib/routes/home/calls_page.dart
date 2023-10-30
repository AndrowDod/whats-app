import 'package:flutter/material.dart';
import 'package:whats_app/models/the_chats.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xff075E55),
                child: ClipOval(child: Icon(Icons.link)),
              ),
              title: Text(
                'Create call link',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Share a link for your WhatsApp call'),
              /*  */
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17, top: 8, right: 340, bottom: 8),
              child: Text(
                'Recent ',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemCount: chatsList.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(chatsList[index].imageurl),
                ),
                title: Text(
                  chatsList[index].name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      chatsList[index].id % 2 == 0
                          ? Icons.call_made
                          : Icons.call_received,
                      size: 20,
                      color: chatsList[index].id % 2 == 0
                          ? Colors.red
                          : Colors.green,
                    ),
                    const Text('Yesterday, 11:45am'),
                  ],
                ),
                trailing: Icon(
                  chatsList[index].id % 2 == 0 ? Icons.call : Icons.videocam,
                  color: const Color.fromARGB(255, 20, 160, 146),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
