import 'package:flutter/material.dart';
import 'qrscanner_widget.dart';
import 'video_widget.dart';
import 'voice_widget.dart';
import 'form_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  int _currentIndex = 0;
  final List<Widget> _children = [
    QrScanner(),
    MyCustomForm(),
    Video(),
    Voice(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navagar'),
      ),
      // body: PageView(
      //   children: _children,
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.qr_code_scanner, color: Colors.blue,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.edit_location_outlined, color: Colors.blue,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.play_arrow_outlined, color: Colors.blue,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mic_none_sharp, color: Colors.blue,),
              label: '',
            ),
          ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}