import 'package:flutter/material.dart';

class WidgetList extends StatefulWidget {
  final Map props;
  WidgetList({Key key, this.props}) : super(key: key);

  @override
  _WidgetListState createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      children: <Widget>[
        Text('${widget.props['title']}'),
        RaisedButton(
          onPressed: () => Navigator.pop(context, "我是返回值"),
          child: Text("返回"),
        )
      ],
    )));
  }
}
