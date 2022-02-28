import 'package:flutter/material.dart';
import 'package:teste/database/app_database.dart';
import 'package:teste/models/contact.dart';
import 'package:teste/screens/dashboard.dart';

void main(){
  runApp( BytebankApp());
    // save(Contact(0, 'Armin', 1234));
    // findAll().then((contacts) => debugPrint(contacts.toString()));
 
  } 

class BytebankApp extends StatelessWidget {

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
