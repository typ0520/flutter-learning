import 'package:flutter/material.dart';

class StatefulGroup extends StatefulWidget {
  @override
  _StatefulGroupState createState() => _StatefulGroupState();
}

//MeterialApp Scaffold AppBar BottomNavigationBar RefreshIndicator Image TextField PageView
class _StatefulGroupState extends State<StatefulGroup> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefulWidget与基础组件',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget与基础组件'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                this._currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.grey),
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list, color: Colors.grey),
                  activeIcon: Icon(Icons.list, color: Colors.blue),
                  title: Text('列表'))
            ]),
        body: this._currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          TextField(
                              decoration: InputDecoration(
                                  hintText: '请输入',
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  hintStyle: TextStyle(
                                      fontSize: 30, color: Colors.red))),
                          Image.network(
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559637574&di=883ba93aa56f71d8f66174544679ea86&imgtype=jpg&er=1&src=http%3A%2F%2Fs9.knowsky.com%2Fbizhi%2Fl%2F20090808%2F200909181%2520%2810%29.jpg'),
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh,
              )
            : Center(child: Text('list')),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(microseconds: 2000));
  }

  Widget _createItemView(String label) {
    return Container(color: Colors.red, child: Center(child: Text(label)));
  }
}
