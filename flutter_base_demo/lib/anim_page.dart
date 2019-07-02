import 'package:flutter/material.dart';

class AnimPage extends StatefulWidget {
  @override
  _AnimPageState createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation =
        Tween<double>(begin: 0.0, end: 300.0).animate(animationController)
          ..addListener(() {
            setState(() {
              animationValue = animation.value;
            });
          })
          ..addStatusListener((status) {
            setState(() {
              this.animationStatus = status;
            });
          });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何使用动画',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何使用动画'),
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
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  this.animationController.reset();
                  this.animationController.forward();
                },
                child: Text('Start'),
              ),
              Text('value: ${this.animationValue}'),
              Text('status: ${this.animationStatus}'),
              Container(
                width: this.animationValue,
                height: this.animationValue,
                child: Image.asset('images/hehe.jpg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}