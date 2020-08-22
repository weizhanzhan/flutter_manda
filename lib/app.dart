import 'package:flutter/material.dart';
import 'package:flutter_manda/widgets/Layout.dart';

Widget createApp() {
  return MaterialApp(
      title: 'manda',
      debugShowCheckedModeBanner: false, //去除debug标签
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutPage());
}
