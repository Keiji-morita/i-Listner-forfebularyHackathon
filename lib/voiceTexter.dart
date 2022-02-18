import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;



class voiceTexter extends StatefulWidget {
  @override
  _voiceTexterState createState() => _voiceTexterState();
}

class _voiceTexterState extends State<voiceTexter> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  String _localeId = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hogehoge'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: Text(_text),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        var systemLocale = await _speech.systemLocale();
        _localeId = systemLocale!.localeId;
        setState(() => _isListening = true);
        _speech.listen(
            onResult: (val) => setState(() {
              _text = val.recognizedWords;
            }),
            localeId: _localeId);
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}

// SizedBox(
// height: 60,
// width: 60,
// child: ElevatedButton(
// child: const Icon(Icons.save_alt),
// style: ElevatedButton.styleFrom(
// primary: Colors.yellow,
// onPrimary: Colors.white,
// shape: const CircleBorder(
// side: BorderSide(
// color: Colors.yellow,
// width: 1,
// style: BorderStyle.solid,
// ),
// ),
// ),
// onPressed: () {
// Navigator.of(context).pop(lastWords);
// },
// ),
// ),