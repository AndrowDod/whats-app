import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/routes/home/tabs_page.dart';
import 'package:whats_app/routes/live_chat.dart';
import 'package:whats_app/routes/login_signup/login_screen.dart';
import 'package:whats_app/routes/login_signup/signup_screen.dart';
import 'package:whats_app/routes/setting_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'whats app',
      routes: {
        '/settingpage': (context) => const SettingPage(),
        '/livechat': (context) => const LiveChatPage(),
        'signup': (context) => SignupScreen(),
        'home': (context) => const TabPage()
      },
      home: LoginScreen(),
    );
  }
}
