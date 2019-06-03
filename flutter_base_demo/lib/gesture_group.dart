import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  double curX = 0, curY = 0;
  String printMsg = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何检测用户手势以及处理点击事件',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text('如何检测用户手势以及处理点击事件'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          body: FractionallySizedBox(
              widthFactor: 1,
              child: Stack(
                children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(color: Colors.blue),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          _printMsg('单击');
                        },
                        onDoubleTap: () {
                          _printMsg('双击');
                        },
                        onLongPress: () {
                          _printMsg('长按');
                        },
                        child: Text(
                          '点我',
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                    ),
                    Text(printMsg)
                  ],),
                  Positioned(
                    left: curX,
                    top: curY,
                    child: GestureDetector(
                      onPanUpdate: (e) => _doMove(e),
                      child: Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(36))),
                    ),
                  ),
                ],
              ))),
    );
  }

  _printMsg(String str) {
    setState(() {
      this.printMsg += str;
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      this.curX += e.delta.dx;
      this.curY += e.delta.dy;
    });
  }
}
