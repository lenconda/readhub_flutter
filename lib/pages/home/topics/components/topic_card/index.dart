import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:readhub/components/loading_box/index.dart';
//import 'package:readhub/components/loading_icon/index.dart';

abstract class TopicCardFrame {
  Widget build(BuildContext context);
}

class TopicCard extends StatelessWidget {
  TopicCard({
    Key key,
    this.id,
    this.title,
    this.summary,
    this.createdAt,
    this.timeline,
    this.order,
//    this.loading = false,
    this.onTap
  });

  final String id;
  final String title;
  final String summary;
  final String createdAt;
  final String timeline;
  final int order;
//  final bool loading;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey[300])
            )
          ),
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            title: Container(
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(title)
                ],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 40,
                  child: Column(
                    children: <Widget>[
                      Text(
                        TimelineUtil.format(DateTime.parse(createdAt).millisecondsSinceEpoch),
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                ),
                Text(summary),
              ],
            )
          ),
        )
      ),
    );
  }
}

class TopicCardLoading extends TopicCard {
  TopicCardLoading({ Key key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingBox();
  }
}
