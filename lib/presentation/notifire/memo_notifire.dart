import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secondfebproject/domain/db/memo_db.dart';
import 'package:secondfebproject/domain/memo/memo_repository.dart';
import '../../domain/memo/memo_data.dart';

final memoNotifierProvider = StateNotifierProvider<MemoNotifier, MemoState>(
  (ref) => MemoNotifier(ref: ref),
  );
  
  class MemoState {
    const MemoState({this.memoList = const []});
    final List<Memo> memoList;
    MemoState copyWith({List<Memo>? memoList}) {
      return MemoState(memoList: memoList ?? <Memo>[]);
    }
  }


  class MemoNotifier extends StateNotifier<MemoState> {
    //コンストラクターでリポジトリーについての記述を書く
    //refがコンストラクターの代わりに呼び出しをおこなっている
    //refのみに依存させることで
    //コンストラクタのrefを呼び出す必要あり

    MemoNotifier({required Ref ref})
      : _ref = ref,
      //superクラス　MemoStateのコンストラクターを呼び出している
        super(const MemoState()) {
          getMemos();
      }

    final Ref  _ref;



    void addMemo(String content) async{
      final id = state.memoList.length + 1;
      //notifier statenotifier連携　ref
      //repositoryにproveiderを作ってそれを参照

      final memoRepo = _ref.watch(memoRepoProvider);
      final memos = await memoRepo.addMemo(
        Memo(
        id: id,
        content: content,
        )
      );

      state = state.copyWith(
        memoList : [
          const Memo().copyWith(id:id, content: content),
          ...state.memoList
          // deepcopy or spread operator 
          //copywithは型定義に注意
        ]
      );

    }

      Future<List<Memo>> getMemos() async {

    final memoRepo = _ref.watch(memoRepoProvider);
    final memos = await memoRepo.getMemos();
    state = state.copyWith(memoList: memos);
    return memos;
  }

    void deleteMemo(int id){
      final newList = state.memoList.where((Memo) => Memo.id != id).toList();
    }
  }

