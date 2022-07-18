import 'dart:ui';

import 'package:flutter/cupertino.dart';

@immutable
class Memo{
    const Memo({this.id = 0, this.content = "", });

  final int id;
  final String content; 

  Memo copyWith({int? id, String? content}){
    return Memo(id:id ?? this.id, content: content ?? this.content);
  }

      Map<String, Object?> toJson() => {
        'id' : id,
      'content': content,
      };
}