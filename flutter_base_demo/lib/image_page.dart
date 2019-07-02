import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

//https://coding.imooc.com/lesson/321.html#mid=23355

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter如何使用图片控件',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter如何使用图片控件'),
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
          child: ListView(
            children: <Widget>[
              //加载网络图片
              Text('加载网络图片'),
              Image.network(
                'https://picsum.photos/250?image=9',
                width: 100,
                height: 100,
              ),
              //加载资源目录里的图片
              Text('加载资源目录里的图片'),
              Image(
                width: 100,
                height: 100,
                image: AssetImage("images/hehe.jpg"),
              ),
              Image.asset("images/hehe.jpg", width: 100, height: 100),
              //加载本地图片
              Text('加载本地图片'),
              FutureBuilder(
                  future: _getLocalFile("hehe.jpg"),
                  builder:
                      (BuildContext context, AsyncSnapshot<File> snapshot) {
                    return snapshot.data != null
                        ? Image.file(snapshot.data, width: 100, height: 100)
                        : Center(
                            child: Text('本地图片加载失败!'),
                          );
                  }),
              //加载内存图片，设置placeholder
              Text('加载内存图片，设置placeholder'),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  CircularProgressIndicator(),
                  FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: 'https://picsum.photos/250?image=9')
                ],
              ),
              //自动缓存的图片
              Text('自动缓存的图片'),
              Container(
                width: 200,
                height: 200,
                child: Center(
                  child: CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: 'https://picsum.photos/250?image=9',
                  ),
                ),
              ),
              Icon(Icons.android, size: 100,)
            ],
          ),
        ),
      ),
    );
  }

  Future<File> _getLocalFile(String fileName) async {
    String dir = (await getExternalStorageDirectory()).path;
    File f = new File('$dir/$fileName');
    return f;
  }
}
