import 'package:flutter/material.dart';
import 'package:flutter_manda/views/TodoList/index.dart';
import 'package:flutter_manda/views/WidgetList/index.dart';

final routes = [
  {
    'path': '/widget_page',
    // ignore: top_level_function_literal_block
    'components': (props) {
      return WidgetList(props: props);
    }
  },
  {
    'path': '/todo_list',
    // ignore: top_level_function_literal_block
    'components': (props) {
      return TodoList(props: props);
    }
  }
];

class $router {
  static push(context, String path, params) {
    try {
      var router = routes.firstWhere((element) => element['path'] == path);
      Function getComponents = router['components'];
      var widget = getComponents(params);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    } catch (err) {
      print(err);
    }
  }

  back() {}
}
