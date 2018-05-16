import 'package:flutter/material.dart';
import 'package:jbmama/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JB Mama",
      theme: ThemeData(primarySwatch: Colors.pink, accentColor: Colors.amber),
      home: HomePage(title: 'JB Mama'),
    );
  }
}
