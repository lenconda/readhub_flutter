import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DevelopersPage extends StatefulWidget {
  DevelopersPage(Key key): super(key: key);

  @override
  _DevelopersPageState createState() => _DevelopersPageState();
}

class _DevelopersPageState extends State<DevelopersPage> {
  final Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Text('developers');
  }
}
