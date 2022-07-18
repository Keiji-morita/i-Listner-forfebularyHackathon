

import 'package:flutter/material.dart';
import 'package:secondfebproject/presentation/pages/memoArea.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp())
    );
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: memoArea(),
    );
  }
}