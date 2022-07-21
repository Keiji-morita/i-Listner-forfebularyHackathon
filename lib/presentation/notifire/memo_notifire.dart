import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secondfebproject/domain/db/memo_db.dart';
import 'package:secondfebproject/domain/memo/memo_repository.dart';
import '../../domain/memo/memo_data.dart';

final memoNotifierProvider = StateNotifierProvider<MemoNotifier, MemoState>(
  (ref) => MemoNotifier(ref: ref,
    MemoRepository(),
    ),
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
    MemoNotifier(this._memoRepository,{required Ref ref})
      : _ref = ref,
        super(const MemoState()) {
          getMemos();
      }

    final Ref  _ref;
    final MemoRepository _memoRepository;


    void addMemo(String content) async{
      final id = state.memoList.length + 1;
      final memos = await _memoRepository.addMemo(
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
    final memos = await _memoRepository.getMemos();
    state = state.copyWith(memoList: memos);
    return memos;
  }

    void deleteMemo(int id){
      final newList = state.memoList.where((Memo) => Memo.id != id).toList();
    }
  }

