import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final Map props;
  TodoList({Key key, this.props}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      children: <Widget>[
        Text('${widget.props['title']} todo'),
        RaisedButton(
          onPressed: () => Navigator.pop(context, "我是返回值"),
          child: Text("返回"),
        )
      ],
    )));
  }
}
