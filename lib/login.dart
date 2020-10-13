// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'home_widget.dart'
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }
//
// class _MyAppState extends State<MyApp> {
//   bool _isLoggedIn = false;
//
//   GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//
//   _login() async {
//     try {
//       await _googleSignIn.signIn();
//       setState(() {
//         _isLoggedIn = true;
//       });
//     } catch (err) {
//       print(err);
//     }
//   }
//
//   _logout() {
//     _googleSignIn.signOut();
//     setState(() {
//       _isLoggedIn = false;
//     });
//   }
//
//   // _speak() async {
//   //   List<Map<String, dynamic>> directions = [
//   //     {
//   //       "room": "Alpha room to Beta Room",
//   //       "direc": "North East",
//   //       "dist": 38.52920913696289
//   //     }
//   //   ];
//   //
//   //   String toSpeak = "Go from " +
//   //       directions[0]["room"] +
//   //       " in the " +
//   //       directions[0]["direc"] +
//   //       " for " +
//   //       directions[0]["dist"].toInt().toString() +
//   //       "meters";
//   //
//   //   FlutterTts flutterTts1 = FlutterTts();
//   //   var result = await flutterTts1.speak(toSpeak);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: Center(
//             child: _isLoggedIn
//                 ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(_googleSignIn.currentUser.displayName),
//                 OutlineButton(
//                   child: Text("Speak"),
//                   onPressed: () {
//                     _speak();
//                   },
//                 ),
//                 OutlineButton(
//                   child: Text("Logout"),
//                   onPressed: () {
//                     _logout();
//                   },
//                 )
//               ],
//             )
//                 : Column(
//               children: <Widget>[
//                 MaterialButton(
//                   // color: Colors.transparent,
//                   child: Text("LOGIN WITH GOOGLE"),
//                   onPressed: () {
//                     _login();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // class TextToSpeech extends StatelessWidget {
//
// //   FlutterTts flutterTts = FlutterTts();
//
// //   flutterTts.setStartHandler(() {
// //     setState(() {
// //       print("playing");
// //       ttsState = TtsState.playing;
// //     });
// //   });
// // }
