import 'package:flutter/material.dart';

class DataList<T> extends StatefulWidget {
  DataList({
    Key key,
    this.refreshThreshold = 50,
    this.loadmoreThreshold = 50,
    @required this.onRefresh,
    @required this.onLoadmore,
    this.onInitialize = null,
    @required this.items,
    @required this.loadmoreComponent,
    @required this.refreshComponent,
    this.initializeComponent = null
  })
      : assert(loadmoreThreshold >= 0),
        assert(refreshThreshold >= 0),
        super(key: key);

  final double refreshThreshold;
  final double loadmoreThreshold;
  final Function onRefresh;
  final Function onLoadmore;
  final Function onInitialize;
  final List<T> items;
  final T loadmoreComponent;
  final T refreshComponent;
  final T initializeComponent;

  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  bool _initializing = true;
  bool _fetching = false;
  bool _refreshing = false;
  bool _scrolling = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double currentPosition = _scrollController.position.pixels;
      double maximumPosition = _scrollController.position.maxScrollExtent;

      if (currentPosition <= 0 - widget.refreshThreshold
          && !_scrolling
          && !_refreshing
      ) {
        setState(() { _refreshing = true; });
        widget.onRefresh().then((result) {
          setState(() { _refreshing = false; });
        });
      }

      if (currentPosition == maximumPosition
          && !_scrolling
          && !_refreshing
      ) {
        setState(() { _fetching = true; });
        widget.onLoadmore().then((result) {
          setState(() { _fetching = false; });
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
              child: ListView(
                cacheExtent: 100,
                physics: BouncingScrollPhysics(),
                controller: _scrollController,
                children: _generateListItems(),
              ),
            )
          : widget.initializeComponent
    );
  }

  List<Widget> _generateListItems() {
    List<Widget> currentListItems = widget.items;

    if (currentListItems[currentListItems.length - 1] != widget.loadmoreComponent) {
      currentListItems.add(widget.loadmoreComponent);
    }

    if (_refreshing) {
      currentListItems.insert(0, widget.refreshComponent);
    }

    return currentListItems;
  }
}
