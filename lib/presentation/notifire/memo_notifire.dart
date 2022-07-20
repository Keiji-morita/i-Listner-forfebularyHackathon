import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secondfebproject/domain/memo/memo_repository.dart';
import '../../domain/memo/memo_data.dart';

final memoNotifierProvider = StateNotifierProvider<MemoNotifier, MemoState>(
  (ref) => MemoNotifier(ref: ref,) 
  );
  
  class MemoState {
    const MemoState({this.memoList = const []});

    final List<Memo> memoList;

    MemoState copyWith({List<Memo>? memoList}) {
      return MemoState(memoList: memoList ?? <Memo>[]);
    }
  }


  class MemoNotifier extends StateNotifier<MemoState> {
    MemoNotifier({required Ref ref})
      : _ref = ref,
      super(const MemoState());
    // final MemoRepository _memoRepository;
    final Ref  _ref;


    void addMemo(String content) async{
      final id = state.memoList.length + 1;

      state = state.copyWith(
        memoList : [
          const Memo().copyWith(id:id, content: content),
          ...state.memoList
          // deepcopy or spread operator 
          //copywithは型定義に注意
        ]
      );

    }

    void deleteMemo(int id){
      final newList = state.memoList.where((Memo) => Memo.id != id).toList();
    }
  }

