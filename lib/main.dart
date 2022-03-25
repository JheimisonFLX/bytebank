import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Column(
          children: [
            //Image.network('https://cdn.pixabay.com/photo/2020/08/09/14/25/business-5475660_960_720.jpg')
            Image.asset('images/bytebank_logo.png'),
            Container(
              color: Colors.green,
              height:120,
              width: 100,
              child: Column(
                children: [
                  Icon(Icons.people),
                  Text('Contacts')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
