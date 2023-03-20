import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/loading.dart';
import 'package:flutter_workspace/pages/home.dart';
import 'package:flutter_workspace/pages/choose_location.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      // 设置路由
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    )
  );
}