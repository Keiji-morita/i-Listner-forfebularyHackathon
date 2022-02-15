import 'package:flutter/material.dart';
import 'package:secondfebproject/memoArea.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';



class voiceTexter extends StatefulWidget {
  @override
  _voiceTexterState createState() => _voiceTexterState();
}

class _voiceTexterState extends State<voiceTexter> {
  // 入力されたテキストをデータとして持つ
  String _text = '';

  String lastWords = "";
  String lastError = '';
  String lastStatus = '';
  stt.SpeechToText speech = stt.SpeechToText();

  Future<void> _speak() async {
    bool available = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (available) {
      speech.listen(onResult: resultListener);
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  Future<void> _stop() async {
    speech.stop();
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = '${result.recognizedWords}';
    });
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    setState(() {
      lastStatus = '$status';
    });
  }

   permissonsStatus () async{
    var status = await Permission.mediaLibrary.status;
    if (status != PermissionStatus.granted) {
      await Permission.mediaLibrary.request();
    }
  }


  // データを元に表示するWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 8),
            Text(lastWords),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              FloatingActionButton(onPressed: () {
                permissonsStatus();
                _speak();
                },
                  child: Icon(Icons.play_arrow)),
              FloatingActionButton(onPressed: _stop, child: Icon(Icons.stop))
            ]),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

            SizedBox(
            height: 60,
            width: 60,
            child: ElevatedButton(
              child: const Icon(Icons.delete),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Colors.red,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),

          SizedBox(
            height: 60,
            width: 60,
            child: ElevatedButton(
              child: const Icon(Icons.save_alt),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                onPrimary: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Colors.yellow,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop( lastWords );
              },
            ),
          ),

          SizedBox(
            height: 60,
            width: 60,
            child: ElevatedButton(
              child: const Icon(Icons.content_copy),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(
                    color: Colors.blue,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),
           ],
         )

          ],
        ),
      ),
    );
  }
}