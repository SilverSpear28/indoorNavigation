import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

const CameraAccessDenied = 'PERMISSION_NOT_GRANTED';

class QrScanner extends StatefulWidget {
  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<QrScanner> with AutomaticKeepAliveClientMixin<QrScanner> {
  String scanResult = 'https://i.pcmag.com/imagery/reviews/04XZEcnsPkVzA9LRP1vRak3-3.1569476522.fit_scale.size_1028x578.jpg';

  Future scanQRCode() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      scanResult = cameraScanResult;
    });
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext content) {
    super.build(content);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          scanResult == '' ? Text('Map') : Image.network(scanResult),
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