import 'package:flutter/material.dart';
import 'package:flutter_manda/views/TodoList/index.dart';
import 'package:flutter_manda/views/WidgetList/index.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  CustomRoute(this.widget)
      : super(
            // 设置过度时间
            transitionDuration: Duration(milliseconds: 500),
            // 构造器
            pageBuilder: (
              // 上下文和动画
              BuildContext context,
              Animation<double> animaton1,
              Animation<double> animaton2,
            ) {
              return widget;
            },
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animaton1,
              Animation<double> animaton2,
              Widget child,
            ) {
              // 需要什么效果把注释打开就行了
              // 渐变效果
              // return FadeTransition(
              //   // 从0开始到1
              //   opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              //     // 传入设置的动画
              //     parent: animaton1,
              //     // 设置效果，快进漫出   这里有很多内置的效果
              //     curve: Curves.fastOutSlowIn,
              //   )),
              //   child: child,
              // );
              // return ScaleTransition(
              //   scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              //       parent: animaton1, curve: Curves.fastOutSlowIn)),
              //   child: child,
              // );
              return SlideTransition(
                position: Tween<Offset>(
                        // 设置滑动的 X , Y 轴
                        begin: Offset(1.0, 0.0),
                        end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animaton1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

Function buildComponent(Function combine) {
  return (props) {
    return combine(props);
  };
}

final routes = [
  {
    'path': '/widget_page',
    'components': buildComponent((props) {
      return WidgetList(props: props);
    })
  },
  {
    'path': '/todo_list',
    'components': buildComponent((props) {
      return TodoList(props: props);
    })
  }
];

class $router {
  static push(context, String path, params) {
    try {
      var router = routes.firstWhere((element) => element['path'] == path);
      Function getComponents = router['components'];
      var widget = getComponents(params);

      Navigator.push(context, CustomRoute(widget));
    } catch (err) {
      print(err);
    }
  }

  back() {}
}
