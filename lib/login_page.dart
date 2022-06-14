import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:secondfebproject/services/auth.dart';

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({Key? key}) : super(key: key);

  @override
  _LoginWithGoogleState createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login With Google"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
              Authentication.signInWithGoogle();
            }, child: Text("Login with google")),

            ElevatedButton(onPressed: () async {
              await FirebaseAuth.instance.signOut();
        
              await GoogleSignIn().signOut();
              setState(() {
                
              });
            }, child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}