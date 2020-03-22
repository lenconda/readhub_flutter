import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../components/topic_card/index.dart';
import '../../../components/data_list/index.dart';

class TopicsPage extends StatefulWidget {
  TopicsPage(Key key): super(key: key);

  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  final Dio _dio = new Dio();
  final Widget Loading = TopicCard(loading: true);
  List<Map<String, dynamic>> _topicList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List> _fetchTopics(String lastCursor) async {
    String cursor = lastCursor.length != 0 ? lastCursor : '';
    print('cursor: $cursor');

    String uri = 'https://api.readhub.cn/topic?lastCursor=$cursor&pageSize=10';
    var response = await _dio.get(uri);
    List list = response.data['data'];
    List<Map<String, dynamic>> newTopics = list.map((item) {
      return {
        'id': item['id'],
        'title': item['title'],
        'summary': item['summary'],
        'order': item['order'],
        'createdAt': item['createdAt'],
        'timeline': item['timeline']
      };
    }).toList();
    setState(() {
      print(newTopics);
      if (cursor.length == 0) {
        _topicList = newTopics;
      } else {
        _topicList.addAll(newTopics);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataList<TopicCard>(
      onRefresh: () => _fetchTopics(''),
      onLoadmore: () => _fetchTopics(_topicList[_topicList.length - 1]['order'].toString()),
      items: _generateListItems(),
      loadmoreComponent: Loading,
      refreshComponent: Loading,
      initializeComponent: Loading,
      loadmoreThreshold: 100,
      onInitialize: () => _fetchTopics(''),
    );
  }

  List<Widget> _generateListItems() {
    List<Widget> currentTopics = _topicList.map((element) {
      return TopicCard(
        id: element['id'],
        title:element['title'],
        summary: element['summary'],
        order: element['order'],
        createdAt: element['createdAt'],
        timeline: element['timeline']
      );
    }).toList();
    return currentTopics;
  }
}
