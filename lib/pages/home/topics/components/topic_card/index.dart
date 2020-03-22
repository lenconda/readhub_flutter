import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:readhub/components/loading_icon/index.dart';

class TopicCard extends StatelessWidget {
  TopicCard({
    Key key,
    this.id,
    this.title,
    this.summary,
    this.createdAt,
    this.timeline,
    this.order,
    this.loading = false,
  });

  final String id;
  final String title;
  final String summary;
  final String createdAt;
  final String timeline;
  final int order;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        height: 40,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LoadingIcon()
          ],
        ),
      );
    } else {
      return Material(
        child: InkWell(
          onTap: () {},
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
}
