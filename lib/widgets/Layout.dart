import 'package:flutter/material.dart';
import 'package:flutter_manda/views/HomePage/index.dart';
import 'package:flutter_manda/views/UserCenter/index.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int navigationIndex = 0;

  List layoutWidgets = [Homepage(), UserCenter()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: layoutWidgets[navigationIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            this.setState(() {
              this.navigationIndex = index;
            });
          },
          currentIndex: navigationIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe792, fontFamily: 'iconfont')),
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe7ae, fontFamily: 'iconfont')),
                title: Text('User'))
          ]),
    );
  }
}
