import 'package:flutter/material.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';

// 文章介绍
// https://codewithandrea.com/articles/multiple-navigators-bottom-navigation-bar/

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(widget.title)),
      body: Row(
        children: [
          Container(color: Colors.grey.withOpacity(0.5), width: 120).addTapEvent(() => startPush(context)),

          // 用Navigator作为他的一个根
          Expanded(
            child: Navigator(
              key: navigatorKey,
              initialRoute: '/',
              onGenerateRoute: (routeSettings) => MaterialPageRoute(builder: (context) => Container(color: Util.randomColor)),
            ).addDebugContainer(borderWidth: 5).addTapEvent(() => startPush(navigatorKey.currentContext!)),
          ),
        ],
      ),
    );
  }

  /// 根据context往上寻找Navigator
  void startPush(BuildContext ctx) => Navigator.push(ctx, MaterialPageRoute(builder: (context) => Container(color: Util.randomColor)));
}
