import 'package:flutter/material.dart';

class LoadingIcon extends StatelessWidget {
  LoadingIcon({
    Key key,
    this.valueColor = Colors.black,
    this.size = 16,
    this.strokeWidth = 1.5
  }): super(key: key);

  final Color valueColor;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation(valueColor),
      ),
    );
  }
}
