import 'package:flutter/material.dart';
import 'package:secondfebproject/memoArea.dart';

class voiceTexter extends StatefulWidget {
  @override
  _voiceTexterState createState() => _voiceTexterState();
}

class _voiceTexterState extends State<voiceTexter> {
  // 入力されたテキストをデータとして持つ
  String _text = '';

  // データを元に表示するWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 入力されたテキストを表示
            Text(_text, style: TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            // テキスト入力
            TextField(
              // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
              onChanged: (String value) {
                // データが変更したことを知らせる（画面を更新する）
                setState(() {
                  // データを変更
                  _text = value;
                });
              },
            ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

            SizedBox(
            height: 60,
            width: 60,
            child: ElevatedButton(
              child: const Icon(Icons.delete),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Colors.red,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),

          SizedBox(
            height: 60,
            width: 60,
            child: ElevatedButton(
              child: const Icon(Icons.save_alt),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                onPrimary: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Colors.yellow,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(_text);
              },
            ),
          ),

          SizedBox(
            height: 60,
            width: 60,
            child: ElevatedButton(
              child: const Icon(Icons.content_copy),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Colors.blue,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              onPressed: () {},
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