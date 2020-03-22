import 'package:flutter/material.dart';
import 'pages/home/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReadHub',
      theme: ThemeData(
        primaryColor: Colors.grey[50],
      ),
      home: HomePage(title: 'ReadHub'),
    );
  }
}

