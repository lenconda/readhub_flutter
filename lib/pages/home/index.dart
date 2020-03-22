import 'package:flutter/material.dart';

import 'package:readhub/pages/home/topics/index.dart';
import 'package:readhub/pages/home/technology/index.dart';
import 'package:readhub/pages/home/developers/index.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key key, this.title }): super(key: key);

  String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> _tabs = [
    { 'name': '热门话题', 'icon': Icons.message, 'page': TopicsPage(Key('0')) },
    { 'name': '科技动态', 'icon': Icons.assessment, 'page': TechnologyPage(Key('1')) },
    { 'name': '开发者资讯', 'icon': Icons.view_compact, 'page': DevelopersPage(Key('2')) }
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
        items: List.from(_tabs.map((element) =>
          BottomNavigationBarItem(
            icon: Icon(element['icon']),
            title: Text(element['name'])
          )
        )),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _tabs[_currentIndex]['page'],// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
