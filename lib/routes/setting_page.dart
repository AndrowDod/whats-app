import 'package:flutter/material.dart';
import 'package:whats_app/models/setting_opstions.dart';

import '../models/the_chats.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff075E55),
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
//profile photo and info
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(chatsList[0].imageurl),
                  ),
                  title: Text(
                    chatsList[0].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Hi, iam flutter mobile developer',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
//the items in setting
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: settingList.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        settingList[index].icons,
                        color: Colors.grey[500],
                      ),
                    ),
                    title: Text(
                      settingList[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey[800]),
                    ),
                    subtitle: Text(
                      settingList[index].disc,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
//text under the items
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'from',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  'Facebook',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
