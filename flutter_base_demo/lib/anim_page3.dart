import 'package:flutter/material.dart';

class AnimPage3 extends StatefulWidget {
  @override
  _AnimPageState2 createState() => _AnimPageState2();
}

class AnimatedLogo extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  AnimatedLogo({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
            width: animation.value,
            height: animation.value,
            child: child,
          ),
      child: child,
    );
  }
}

class _AnimPageState2 extends State<AnimPage3>
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
      title: '如何使用AnimationBuilder',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何使用AnimationBuilder'),
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
          child: Column(children: <Widget>[
            GestureDetector(
              onTap: () {
                this.animationController.reset();
                this.animationController.forward();
              },
              child: Text('Start'),
            ),
            Text('value: ${this.animationValue}'),
            Text('status: ${this.animationStatus}'),
            AnimatedLogo(child: Image.asset('images/hehe.jpg'), animation: animation),
          ]),
        ),
      ),
    );
  }
}
