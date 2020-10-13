import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrScanner extends StatefulWidget {
  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<QrScanner> {
  String scanResult = '';

  Future scanQRCode() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      scanResult = cameraScanResult;
    });
  }
  @override
  Widget build(BuildContext content) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          scanResult == '' ? Text('Map') : Text(scanResult),
          SizedBox(height: 20),
          RaisedButton(
            color: Colors.blue,
            child: Text('Click To Scan', style: TextStyle(color: Colors.white),),
            onPressed: scanQRCode,
          )
        ]
      ),
    );
  }
}