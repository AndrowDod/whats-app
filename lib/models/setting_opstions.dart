import 'package:flutter/material.dart';

class Settingmodel {
  final IconData icons;
  final String name;
  final String disc;

  Settingmodel({required this.icons, required this.name, required this.disc});
}

final List<Settingmodel> settingList = [
  Settingmodel(
      icons: Icons.key,
      name: "Account",
      disc: 'Privacy,security,change number'),
  Settingmodel(
      icons: Icons.chat, name: "Chats", disc: 'Them,wallpapers,chat history'),
  Settingmodel(
      icons: Icons.notifications,
      name: "Notifications",
      disc: 'Message,group & call tones'),
  Settingmodel(
      icons: Icons.circle_outlined,
      name: "Storege and Data",
      disc: 'Network usage,auto-download'),
  Settingmodel(
      icons: Icons.help_outline,
      name: "Help",
      disc: 'Help centre,contact us,privacy policy'),
  Settingmodel(icons: Icons.people_alt, name: "Invite a Friend", disc: ''),
];
