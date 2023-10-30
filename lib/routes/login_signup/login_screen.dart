import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/routes/login_signup/signup_screen.dart';
import 'package:whats_app/widgets/buttons_modle.dart';
import 'package:whats_app/widgets/text_field_modle.dart';

String? email;
String? password;
TextEditingController emailcontrolar = TextEditingController();
TextEditingController passwordcontrolar = TextEditingController();

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  late UserCredential user;

  @override
  Widget build(BuildContext context) {
    final theheight = MediaQuery.of(context).size.height;
    final thewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 92, 84),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: theheight * 0.2,
            ),
            // sign in text--------------
            const Center(
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 70,
            ),

            // text field of email----------------
            Padding(
                padding: EdgeInsets.only(
                    left: thewidth * 0.03, right: thewidth * 0.03),
                child: TextFieldModle(
                  controlar: emailcontrolar,
                  name: 'Email',
                )),
            SizedBox(
              height: theheight * 0.04,
            ),

            // text field of password-------------
            Padding(
                padding: EdgeInsets.only(
                    left: thewidth * 0.03, right: thewidth * 0.03),
                child: TextFieldModle(
                  ispassword: true,
                  controlar: passwordcontrolar,
                  name: 'Password',
                )),
            SizedBox(
              height: theheight * 0.04,
            ),

            // the sign im button----------------------
            Buttons(
              operation: 'sign In',
              onpressd: () async {
                try {
                  await auth.signInWithEmailAndPassword(
                      email: email!, password: password!);

                  emailcontrolar.clear();
                  passwordcontrolar.clear();
                  // ignore: use_build_context_synchronously
                  Navigator.of(context)
                      .pushReplacementNamed('home', arguments: email);
                } catch (ex) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('there was wrong check email and password'),
                  ));
                }
              },
            ),

            //register button--------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'I dont have acount',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                  child: const Text(
                    'signup',
                    style: TextStyle(color: Color.fromARGB(255, 62, 201, 187)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
