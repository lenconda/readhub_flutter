import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:readhub/pages/home/topics/components/topic_card/index.dart';
import 'package:readhub/components/data_list/index.dart';
import 'package:readhub/models/topic.dart';
import 'package:readhub/pages/topic_detail/index.dart';

class TopicsPage extends StatefulWidget {
  TopicsPage(Key key): super(key: key);

  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  final Dio _dio = new Dio();
  final Widget Loading = TopicCardLoading();
  List<Topic> _topicList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List> _fetchTopics(String lastCursor) async {
    String cursor = lastCursor.length != 0 ? lastCursor : '';

    String uri = 'https://api.readhub.cn/topic?lastCursor=$cursor&pageSize=10';
    Response response = await _dio.get(uri);

    List list = response.data['data'];
    List<Topic> topics = list.map((item) {
      return Topic.fromJson(item);
    }).toList();

    setState(() {
      if (cursor.length == 0) {
        _topicList = topics;
      } else {
        _topicList.addAll(topics);
      }
    });
  }

  List<Widget> _generateListItems() {
    List<Widget> currentTopics = _topicList.map((element) {
      return TopicCard(
        id: element.id,
        title: element.title,
        summary: element.summary,
        order: element.order,
        createdAt: element.createdAt,
        timeline: element.timeline,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (content) {
            return TopicDetailPage(
              title: element.title,
              content: 'oiejfo',
            );
          }));
        },
      );
    }).toList();
    return currentTopics;
  }

  @override
  Widget build(BuildContext context) {
    return DataList<TopicCard>(
      onRefresh: () => _fetchTopics(''),
      onLoadmore: () => _fetchTopics(_topicList[_topicList.length - 1].order.toString()),
      items: _generateListItems(),
      loadmoreComponent: Loading,
      refreshComponent: Loading,
      initializeComponent: Loading,
      loadmoreThreshold: 100,
      onInitialize: () => _fetchTopics(''),
    );
  }
}
