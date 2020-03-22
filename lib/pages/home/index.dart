import 'package:flutter/material.dart';
import '../test/index.dart';

import './topics/index.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key key, this.title }): super(key: key);

  String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> tabs = [
    { 'name': '热门话题', 'icon': Icons.message },
    { 'name': '科技动态', 'icon': Icons.assessment },
    { 'name': '开发者资讯', 'icon': Icons.view_compact }
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 11,
        selectedFontSize: 11,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey[400],
        currentIndex: _currentIndex,
        items: List.from(
            tabs.map(
                    (element) =>
                        BottomNavigationBarItem(icon: Icon(element['icon']), title: Text(element['name']))
            )
        ),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: TopicsPage(Key('1')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => TestPage(title: 'Test', content: DateTime.now().toString()))
          );
        },
        tooltip: 'Increment',
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
