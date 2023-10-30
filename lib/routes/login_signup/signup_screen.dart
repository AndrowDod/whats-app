import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/widgets/buttons_modle.dart';
import 'package:whats_app/widgets/text_field_modle.dart';

import 'login_screen.dart';

var auth = FirebaseAuth.instance;

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController passwordcontrolar = TextEditingController();
  late UserCredential userinfo;

  @override
  Widget build(BuildContext context) {
    final theheight = MediaQuery.of(context).size.height;
    final thewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 92, 84),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      //the body of app---------------------
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: theheight * 0.1,
            ),
            //the sign in text----------------------
            Center(
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: thewidth * 0.09,
                ),
              ),
            ),
            SizedBox(
              height: theheight * 0.09,
            ),

            //email text field-------------------------
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFieldModle(name: 'Email')),
            SizedBox(
              height: theheight * 0.04,
            ),

            // password text field-------------------
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFieldModle(
                name: 'Password',
                ispassword: true,
              ),
            ),
            SizedBox(
              height: theheight * 0.04,
            ),

            // sign up button--------------------------
            Buttons(
                operation: 'Sign Up',
                onpressd: () async {
                  try {
                    await auth.createUserWithEmailAndPassword(
                        email: email!, password: password!);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Sucsses'),
                    ));
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                  } on FirebaseAuthException catch (ex) {
                    if (ex.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('the password is weak'),
                      ));
                    } else if (ex.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('this email already exists try sign in'),
                      ));
                    }
                  } catch (ex) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('ther was error'),
                    ));
                  }
                })
          ],
        ),
      ),
    );
  }
}
