import 'package:flutter/material.dart';
import 'core/constants/strings.dart';
import 'presentation/ui/home/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      home: const HomeView(),
      theme: ThemeData(
        fontFamily: manropeFont,
      ),
    );
  }
}
