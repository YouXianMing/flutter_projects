import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/app.dart';

// 文章介绍
// https://codewithandrea.com/articles/multiple-navigators-bottom-navigation-bar/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const App(),
    );
  }
}
