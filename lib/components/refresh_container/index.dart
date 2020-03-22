import 'package:flutter/material.dart';

class RefreshContainer extends StatefulWidget {
  RefreshContainer({
    Key key,
    this.refreshThreshold = 50,
    @required this.onRefresh,
    this.onInitialize = null,
    @required this.children,
    @required this.refreshComponent,
    @required this.initializeComponent,
  })
      : assert(refreshThreshold >= 0),
        super(key: key);

  final double refreshThreshold;
  final Function onRefresh;
  final Function onInitialize;
  final List children;
  final Widget refreshComponent;
  final Widget initializeComponent;

  @override
  _RefreshContainerState createState() => _RefreshContainerState();
}

class _RefreshContainerState extends State<RefreshContainer> {
  bool _initializing = false;
  bool _refreshing = false;
  bool _scrolling = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double currentPosition = _scrollController.position.pixels;
      print(currentPosition);

      if (currentPosition <= 0 - widget.refreshThreshold && !_scrolling && !_refreshing) {
        setState(() { _refreshing = true; });
        widget.onRefresh().then((result) {
          setState(() { _refreshing = false; });
        });
      }
    });

    if (widget.onInitialize != null) widget.onInitialize().then((result) {
      setState(() { _initializing = false; });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  List<Widget> _generateListItems() {
    List<Widget> currentListItems = widget.children;

    if (_refreshing) {
      currentListItems.insert(0, widget.refreshComponent);
    }

    return currentListItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !_initializing
          ? Listener(
              onPointerDown: (event) {
                setState(() { _scrolling = true; });
              },
              onPointerUp: (event) {
                setState(() { _scrolling = false; });
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                controller: _scrollController,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _generateListItems(),
                  )
                )
              ),
            )
          : widget.initializeComponent
    );
  }
}
