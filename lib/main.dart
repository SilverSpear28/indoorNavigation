import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  _speak() async {
    List<Map<String, dynamic>> directions = [
      {"room": "A to C", "direc": "NE", "dist": 38.52920913696289},
      {"room": "C to H", "direc": "NW", "dist": 76.06083679199219}
    ];

    String toSpeak = "Go from " +
        directions[0]["room"] +
        " in the " +
        directions[0]["direc"] +
        " for " +
        directions[0]["dist"].toInt().toString() +
        "meters";

    FlutterTts flutterTts1 = FlutterTts();
    var result = await flutterTts1.speak(toSpeak);

    await new Future.delayed(const Duration(seconds: 2));

    String toSpeak1 = "Go from " +
        directions[1]["room"] +
        " in the " +
        directions[1]["direc"] +
        " for " +
        directions[1]["dist"].toInt().toString() +
        "meters";

    FlutterTts flutterTts2 = FlutterTts();
    var result1 = await flutterTts2.speak(toSpeak1);

    // if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: _isLoggedIn
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_googleSignIn.currentUser.displayName),
                      OutlineButton(
                        child: Text("Speak"),
                        onPressed: () {
                          _speak();
                        },
                      ),
                      OutlineButton(
                        child: Text("Logout"),
                        onPressed: () {
                          _logout();
                        },
                      )
                    ],
                  )
                : Column(
                    children: <Widget>[
                      MaterialButton(
                        // color: Colors.transparent,
                        child: Text("LOGIN WITH GOOGLE"),
                        onPressed: () {
                          _login();
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

// class TextToSpeech extends StatelessWidget {

//   FlutterTts flutterTts = FlutterTts();

//   flutterTts.setStartHandler(() {
//     setState(() {
//       print("playing");
//       ttsState = TtsState.playing;
//     });
//   });
// }
