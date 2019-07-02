import 'package:flutter/material.dart';

class AnimHero1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何使用hero动画1',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何使用hero动画1'),
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
          child: Center(
            child: Hero(
                tag: "https://picsum.photos/250?image=9",
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Hero1TestPage()));
                  },
                  child: Image.network("https://picsum.photos/250?image=9"),
                )),
          ),
        ),
      ),
    );
  }
}

class Hero1TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hero动画1测试',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text('hero动画1测试'),
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
            color: Colors.blueAccent,
            alignment: Alignment.topLeft,
            child: Hero(
                tag: "https://picsum.photos/250?image=9",
                child: SizedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.network("https://picsum.photos/250?image=9"),
                  ),
                  width: 100,
                  height: 100,
                )),
          ),),
    );
  }
}
