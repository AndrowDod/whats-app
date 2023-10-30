import 'package:flutter/material.dart';
import 'package:whats_app/routes/home/camera_page.dart';
import 'package:whats_app/routes/home/chats_page.dart';
import 'package:whats_app/routes/home/stores_page.dart';

import 'calls_page.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments.toString();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff075E55),
          title: const Text(
            'Whats App',
            style: TextStyle(fontSize: 22),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 28,
              ),
            ),
            PopupMenuButton(
              onSelected: (selected) {
                selected == 5
                    ? Navigator.pushNamed(context, '/settingpage')
                    : null;
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text('New Group'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('New broadcast'),
                ),
                const PopupMenuItem(
                  value: 3,
                  child: Text('Linked devices'),
                ),
                const PopupMenuItem(
                  value: 4,
                  child: Text('Starred messages'),
                ),
                const PopupMenuItem(
                  value: 5,
                  child: Text('Setting'),
                ),
              ],
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            tabs: [
              SizedBox(
                width: 15,
                height: 15,
                child: Tab(
                  child: Icon(Icons.camera_alt),
                ),
              ),
              SizedBox(
                width: 85,
                child: Tab(
                  child: Text('Chats'),
                ),
              ),
              SizedBox(
                width: 85,
                child: Tab(
                  child: Text('Status'),
                ),
              ),
              SizedBox(
                width: 85,
                child: Tab(
                  child: Text('Calls'),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const CameraPage(),
            ChatPage(email: email),
            const StoresPage(),
            const CallsPage(),
          ],
        ),
      ),
    );
  }
}
