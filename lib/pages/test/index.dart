import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  TestPage({
    Key key,
    this.content,
    this.title
  }): super(key: key);

  final String content;
  final String title;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.content)
          ],
        ),
      ),
    );
  }
}
