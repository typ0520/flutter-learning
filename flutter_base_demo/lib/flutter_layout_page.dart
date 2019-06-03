import 'package:flutter/material.dart';

class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

//Opacity 控制透明度
//ClipOval 把图片裁剪成圆形
//ClipRRect 裁剪成矩形
//PhysicalModel 把布局显示成不同形状

//MeterialApp Scaffold AppBar BottomNavigationBar RefreshIndicator Image TextField PageView
class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter布局',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter布局'),
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
        body: Container(
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                ClipOval(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559637574&di=883ba93aa56f71d8f66174544679ea86&imgtype=jpg&er=1&src=http%3A%2F%2Fs9.knowsky.com%2Fbizhi%2Fl%2F20090808%2F200909181%2520%2810%29.jpg')),
                ),
                Opacity(
                    opacity: 0.5,
                    child: ClipOval(
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559637574&di=883ba93aa56f71d8f66174544679ea86&imgtype=jpg&er=1&src=http%3A%2F%2Fs9.knowsky.com%2Fbizhi%2Fl%2F20090808%2F200909181%2520%2810%29.jpg')),
                    )),
                ClipRRect(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(30.0)),
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559637574&di=883ba93aa56f71d8f66174544679ea86&imgtype=jpg&er=1&src=http%3A%2F%2Fs9.knowsky.com%2Fbizhi%2Fl%2F20090808%2F200909181%2520%2810%29.jpg')),
                ),
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Image.network(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559637574&di=883ba93aa56f71d8f66174544679ea86&imgtype=jpg&er=1&src=http%3A%2F%2Fs9.knowsky.com%2Fbizhi%2Fl%2F20090808%2F200909181%2520%2810%29.jpg'),
                    )),
              ]),
              Stack(
                children: <Widget>[
                  Opacity(
                      opacity: 0.5,
                      child: ClipOval(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(
                                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559637574&di=883ba93aa56f71d8f66174544679ea86&imgtype=jpg&er=1&src=http%3A%2F%2Fs9.knowsky.com%2Fbizhi%2Fl%2F20090808%2F200909181%2520%2810%29.jpg')),
                      )),
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Image.network(
                            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559637574&di=883ba93aa56f71d8f66174544679ea86&imgtype=jpg&er=1&src=http%3A%2F%2Fs9.knowsky.com%2Fbizhi%2Fl%2F20090808%2F200909181%2520%2810%29.jpg'),
                      )),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559637574&di=883ba93aa56f71d8f66174544679ea86&imgtype=jpg&er=1&src=http%3A%2F%2Fs9.knowsky.com%2Fbizhi%2Fl%2F20090808%2F200909181%2520%2810%29.jpg'),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 100,
                child: PageView(
                  children: <Widget>[
                    _createItemView('Page1'),
                    _createItemView('Page2'),
                    _createItemView('Page3')
                  ],
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  decoration: BoxDecoration(color: Colors.green),
                  alignment: Alignment.center,
                  child: Text('宽度撑满'),
                ),
              ),
              //从左向右排，自动换行
              Wrap(
                //水平间距
                spacing: 20,
                //垂直间距
                runSpacing: 8,
                children: <Widget>[
                  _chip('Flutter'),
                  _chip('Layout'),
                  _chip('wrap'),
                  _chip('left'),
                  _chip('to'),
                  _chip('right'),
                ],
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text('填充Y轴可用高度'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String label) {
    return Chip(
        label: Text(label),
        avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child:
                Text(label.substring(0, 1), style: TextStyle(fontSize: 10))));
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(microseconds: 2000));
  }

  Widget _createItemView(String label) {
    return Container(color: Colors.red, child: Center(child: Text(label)));
  }
}
