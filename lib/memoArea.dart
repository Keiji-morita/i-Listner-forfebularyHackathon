import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secondfebproject/voiceTexter.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

class memoArea extends StatefulWidget {
  const memoArea({Key? key}) : super(key: key);

  @override
  _memoAreaState createState() => _memoAreaState();
}

class _memoAreaState extends State<memoArea> {
  // Todoリストのデータ
  List<String> memoList = [];

  get direction => DismissDirection.endToStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBarを表示し、タイトルも設定
        appBar: AppBar(
          title: Text('Home'),
            backgroundColor: Colors.green,
          actions: [
            IconButton(onPressed: () async => 
            await FirebaseAuth.instance.signOut()
            , icon: Icon(Icons.logout))
          ],
        ),
        // データを元にListViewを作成
        body: ListView.builder(
          itemCount: memoList.length,
          itemBuilder: (BuildContext context, int index) {
            return new Dismissible(
              child: new Card(
                child: ListTile(
                  title: Text(memoList[index]),
                ),
              ),
              key: ValueKey<String>(memoList[index]),
              background: Container(
                  color: Colors.red,
                  child:  Icon(Icons.delete )
              ),

              onDismissed: (DismissDirection direction) {
                setState(() {
                  memoList.removeAt(index);
                });
              },
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
              setState(() {
                memoList.add(newListText);
              });
            }
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.settings_voice),
        )
    );
  }
}
