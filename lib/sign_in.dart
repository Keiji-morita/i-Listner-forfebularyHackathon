import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:secondfebproject/login_parts/login_methods.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ''
        ),
      ),
      body: Center(
        child: SizedBox( 
          height: 50,
        child: SignInButton(
        Buttons.Google,
        onPressed: () {
          final provider = 
                  Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
        },
)
        ),
      ),
    );
  }
}