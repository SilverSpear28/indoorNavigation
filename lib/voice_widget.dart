import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Voice extends StatefulWidget {
  @override
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  String read = 'Go from room A to room E in northest direction for 20 meters then goto room E in norethest direction for 16 meters.';

  _speak() async {
    FlutterTts flutterTts1 = FlutterTts();
    var result = await flutterTts1.speak(read);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child : RaisedButton(
        onPressed: _speak,
        padding: EdgeInsets.all(16.0),
        child: Text("Directions", style: TextStyle(
          color: Colors.white,
        ),),
        color: Colors.blue,
        ),
    );
  }
}