import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondfebproject/login_parts/login_methods.dart';
import 'package:secondfebproject/memoArea.dart';
import 'package:secondfebproject/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  get child => null;
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    ),
  );
  
}