import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless与基础控件'),
        ),
        body: Container(
          constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 400.0,
          ),
          padding: const EdgeInsets.all(8.0),
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 200.0),
          color: Colors.blue[600],
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text("hello", style: TextStyle(fontSize: 20)),
              Icon(Icons.phone),
              CloseButton(),
              Chip(avatar: Icon(Icons.timer), label: Text("2018-10-30")),
              Divider(
                height: 10.0,
                color: Colors.black,
              ),
              AlertDialog(
                  title: Text(
                    '标题2',
                    textAlign: TextAlign.center,
                  ),
                  content: Text('内容2')),
              Card(
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('I am card',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
