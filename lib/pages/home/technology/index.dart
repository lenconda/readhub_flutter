import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class TechnologyPage extends StatefulWidget {
  TechnologyPage(Key key): super(key: key);

  @override
  _TechnologyPageState createState() => _TechnologyPageState();
}

class _TechnologyPageState extends State<TechnologyPage> {
  final Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Text('technology');
  }
}
