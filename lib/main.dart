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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _isLoggedIn
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_googleSignIn.currentUser.displayName),
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
                    Container(
                      height: 800,
                    ),
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
    );
  }
}

class TextToSpeech extends StatelessWidget {

  FlutterTts flutterTts = FlutterTts();

  flutterTts.setStartHandler(() {
    setState(() {
      print("playing");
      ttsState = TtsState.playing;
    });
  });
}
