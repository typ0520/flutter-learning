import 'package:flutter/material.dart';
import 'package:flutter_base_demo/flutter_layout_page.dart';
import 'package:flutter_base_demo/gesture_group.dart';
import 'package:flutter_base_demo/less_group_page.dart';
import 'package:flutter_base_demo/res_page.dart';
import 'package:flutter_base_demo/stateful_group_page.dart';
import 'package:flutter_base_demo/launch_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: RouteNavigator(),
        routes: <String, WidgetBuilder>{
          'less': (BuildContext context) => LessGroupPage(),
          'full': (BuildContext context) => StatefulGroup(),
          'layout': (BuildContext context) => FlutterLayoutPage(),
          'gesture': (BuildContext context) => GesturePage(),
          'res': (BuildContext context) => ResourcePage(),
          'launch': (BuildContext context) => LaunchPage(),
        });
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.only(top: 100),
        child: Column(children: <Widget>[
          FractionallySizedBox(
            widthFactor: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.blue),
              margin: EdgeInsets.only(top: 50, bottom: 50),
              alignment: Alignment.center,
              child: Text(
                '第一种跳转方式',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LessGroupPage()));
            },
            child: Text('不通过路由直接跳转到某个页面'),
          ),
          FractionallySizedBox(
            widthFactor: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.blue),
              margin: EdgeInsets.only(top: 50, bottom: 50),
              alignment: Alignment.center,
              child: Text(
                '第二种跳转方式',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          _item('Stateless与基础控件', 'less'),
          _item('StatefulWidget与基础组件', 'full'),
          _item('Flutter布局', 'layout'),
          _item('如何检测用户手势以及处理点击事件', 'gesture'),
          _item('Flutter如何使用资源文件', 'res'),
          _item('Flutter如何打开第三方应用', 'launch'),
        ]));
  }

  Widget _item(String title, String routeName) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(title),
    );
  }
}
