import 'package:flutter/material.dart';
import 'qrscanner_widget.dart';
import 'video_widget.dart';
import 'voice_widget.dart';

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
              icon: new Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              label: 'Profile',
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