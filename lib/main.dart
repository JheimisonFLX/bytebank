import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'models/contact.dart';
import 'screens/contact_form.dart';
import 'screens/contacts_list.dart';

void main() {
  runApp(const BytebankApp());
  //save(Contact(0, 'teste', 1000));
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        appBarTheme: AppBarTheme(color: Colors.green[900]),
      ),
      home: Dashboard(),
    );
  }
}
