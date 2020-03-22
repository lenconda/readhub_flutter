import 'package:flutter/material.dart';
import 'package:readhub/components/loading_icon/index.dart';

class LoadingBox extends StatelessWidget {
  LoadingBox({
    Key key,
    this.height = 40,
    this.valueColor = Colors.black,
    this.size = 16,
    this.strokeWidth = 1.5
  }): super(key: key);

  final double height;
  final Color valueColor;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          LoadingIcon(
            size: size,
            strokeWidth: strokeWidth,
            valueColor: valueColor,
          )
        ],
      ),
    );
  }
}
