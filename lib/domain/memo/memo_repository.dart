import 'package:secondfebproject/domain/db/memo_db.dart';
import 'package:secondfebproject/domain/memo/memo_data.dart';

class MemoRepository {
    final _db = MemoDatabase(); 
    
    final MemoDatabase _memoDatabase;

    MemoRepository(this._memoDatabase);
    
    Future<List<Memo>> getMemos() async {
      return await _memoDatabase.getMemos();
    }

    Future<Memo> addMemo(Memo memo) async {
      return  _memoDatabase.insertMemo(memo);
    }

    Future<void> updateMemo(Memo memo) async {
      return  _memoDatabase.updateMemo(Memo, memo);
    }

    Future<void> deleteMemo(int id) async {
      return _memoDatabase.deleteMemo(id, Memo);
    }
  }