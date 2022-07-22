import 'package:secondfebproject/domain/db/app_db.dart';
import 'package:secondfebproject/domain/memo/memo_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class MemoDatabase extends AppDatabase{
    final String _tableName = 'memos';

  Future<List<Memo>> getMemos() async {
    final db = await database;
    final maps = await db.query(
      _tableName,
      orderBy: 'id DESC',
    );

    if (maps.isEmpty) return [];
    return maps.map((map) => Memo.fromJson(map)).toList();

  }

  Future<Memo>insertMemo(memo) async {
    final db = await database;
    await db.insert(
      'memos', 
    memo.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace
    );

    return memo.copyWith(
      id: memo.id,
    );
  }

  Future<void> updateMemo(memos, memo) async {
    final db = await database;
    await db.update('memos',
    memos.toMap(),
    where: "id = ?",
    whereArgs: [memos.id],
    );

  }

  Future<void> deleteMemo(int id) async {
    final db = await database;
    await db.delete(
      'memos',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}