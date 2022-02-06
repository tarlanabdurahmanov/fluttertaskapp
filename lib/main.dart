import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/strings.dart';
import 'package:fluttertaskapp/presentation/ui/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      home: HomeView(),
      theme: ThemeData(
        fontFamily: manropeFont,
      ),
    );
  }
}
