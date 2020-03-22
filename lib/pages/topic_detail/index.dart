import 'package:flutter/material.dart';
import 'package:readhub/components/loading_box/index.dart';
import 'package:readhub/components/refresh_container/index.dart';

class TopicDetailPage extends StatefulWidget {
  TopicDetailPage({
    Key key,
    this.content,
    this.title
  }): super(key: key);

  final String content;
  final String title;

  @override
  _TopicDetailPageState createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshContainer(
        onRefresh: () {},
        children: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split("")
      //每一个字母都用一个Text显示,字体为原来的两倍
          .map((c) => Text(c, textScaleFactor: 2.0,))
          .toList(),
        initializeComponent: LoadingBox(),
        refreshComponent: LoadingBox(),
      ),
    );
  }
}
