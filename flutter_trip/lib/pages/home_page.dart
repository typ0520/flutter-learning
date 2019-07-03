import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APP_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollNotification &&
                  notification.depth == 0) {
                _onScroll(notification.metrics.pixels);
              }
            },
            child: ListView(
              children: <Widget>[
                Container(
                    height: 160,
                    child: Stack(
                      children: <Widget>[
                        Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.network(
                              "http://via.placeholder.com/350x150",
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: 3,
                          pagination: new SwiperPagination(),
                        ),

                      ],
                    )),
                Container(
                  height: 800,
                )
              ],
            )),
      ),

      Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(color: Colors.white),
            child: ListTile(
              title: Center(
                child: Text('首页'),
              ),
            ),
          ))
    ],);
  }

  void _onScroll(double pixels) {
    print(pixels);
    double alpha = pixels / APP_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      appBarAlpha = alpha;
    });
  }
}
