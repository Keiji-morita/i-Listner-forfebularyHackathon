import 'package:flutter/material.dart';
import 'package:secondfebproject/voiceTexter.dart';





class memoArea extends StatefulWidget {
  @override
  _memoAreaState createState() => _memoAreaState();
}

class _memoAreaState extends State<memoArea> {
  // Todoリストのデータ
  List<String> memoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBarを表示し、タイトルも設定
      appBar: AppBar(
        title: Text('Home'),
      ),
      // データを元にListViewを作成
      body: ListView.builder(
        itemCount: memoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(memoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return voiceTexter();
            }),
          );
          if (newListText != null) {
            // キャンセルした場合は newListText が null となるので注意
            setState(() {
              // リスト追加
              memoList.add(newListText);
            });
          }
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.settings_voice),
      ),
    );
  }
}

