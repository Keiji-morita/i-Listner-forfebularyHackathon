import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secondfebproject/domain/db/memo_db.dart';
import 'package:secondfebproject/domain/memo/memo_data.dart';

final memoRepoProvider = Provider<MemoRepository>(
  (ref) => MemoRepository(),
  );

class MemoRepository {
  
    MemoRepository();


//値が何もない状態で定数化できない
    final _db = MemoDatabase(); 

    // MemoRepository(this._db);
    
    Future<List<Memo>> getMemos() async {
      return await _db.getMemos();
    }

    Future<Memo> addMemo(Memo memo) async {
      return  _db.insertMemo(memo);
    }

    Future<void> updateMemo(Memo memo) async {
      return  _db.updateMemo(Memo, memo);
    }

    Future<void> deleteMemo(int id) async {
      return _db.deleteMemo(id);
    }
  }