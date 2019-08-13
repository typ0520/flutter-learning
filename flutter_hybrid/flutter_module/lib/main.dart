import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/services.dart';

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
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', initParams: window.defaultRouteName,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String initParams;

  MyHomePage({Key key, this.title, this.initParams}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const EventChannel _eventChannelPlugin =
  EventChannel('EventChannelPlugin');

  static const MethodChannel _methodChannelPlugin =
  const MethodChannel('MethodChannelPlugin');

  static const BasicMessageChannel<String> _basicMessageChannelPlugin =
  BasicMessageChannel('BasicMessageChannelPlugin', StringCodec());

  StreamSubscription _streamSubscription;
  String _showMessage;
  bool _isMethodChannelPlugin = false;

  @override
  void initState() {
    super.initState();

    _streamSubscription =
        _eventChannelPlugin.receiveBroadcastStream('123').listen(_onToDart);

    _basicMessageChannelPlugin.setMessageHandler((message) async {
      setState(() {
        _showMessage = "BasicMessageChannel: " + message;
      });

      return "收到Native的消息: " + message;
    });
  }

  void _onToDart(message) {
    setState(() {
      _showMessage = "EventChannel: " + message;
    });
    print('message: ' + message);
  }

  void _onChannelChanged(bool value) =>
      setState(() => _isMethodChannelPlugin = value);

  void _onTextChanged(value) async {
    String response;
    try {
      if (_isMethodChannelPlugin) {
        response = await _methodChannelPlugin.invokeMethod('send', value);

        setState(() {
          _showMessage = "MethodChannel: " + response;
        });
      } else {
        response = await _basicMessageChannelPlugin.send(value);

        setState(() {
          _showMessage = "BasicMessageChannel: " + response;
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 70),
        child: Column(
          children: <Widget>[
            SwitchListTile(
              value: _isMethodChannelPlugin,
              onChanged: _onChannelChanged,
              title: Text(_isMethodChannelPlugin
                  ? "MethodChannelPlugin"
                  : "BasicMessageChannelPlugin"),
            ),
            TextField(
              onChanged: _onTextChanged,
            ),
            Text("收到初始化参数: " +  window.defaultRouteName),
            Text("Native传来的数据: ${this._showMessage}"),
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
