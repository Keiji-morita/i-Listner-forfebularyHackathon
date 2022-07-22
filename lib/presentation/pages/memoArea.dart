import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secondfebproject/presentation/notifire/memo_notifire.dart';
import 'package:secondfebproject/presentation/pages/voiceTexter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

class memoArea extends ConsumerWidget {
  const memoArea({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(memoNotifierProvider);
    final notifier = ref.watch(memoNotifierProvider.notifier);

    return Scaffold(
            // AppBarを表示し、タイトルも設定
        appBar: AppBar(
          title: Text('Home'),
            backgroundColor: Colors.green,
        ),
        // データを元にListViewを作成
        body: ListView.builder(
          itemCount: state.memoList.length,
          itemBuilder: (BuildContext context, int index) {
            final memo = state.memoList[index];

            return new Dismissible(
              key: Key(state.memoList.length.toString()),
              onDismissed: (DismissDirection direction) {
                notifier.deleteMemo(memo.id);
              },
            child: SizedBox(
              height: 70,
              child: Card(
                child: Center(
                  child: Text(memo.content),
                )
              ,)
              ,)
            );

          },
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return voiceTexter();
            }),
          );
          if (newListText != null) {
            // キャンセルした場合は newListText が null となるので注意
            notifier.addMemo(newListText);
          }

          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.settings_voice),
        )
    );
  }
}
