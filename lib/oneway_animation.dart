import 'package:flutter/material.dart';
import 'dart:math' as math;

class OneWayAnimation extends StatefulWidget {
  OneWayAnimation({Key key}) : super(key: key);

  @override
  _OneWayAnimationState createState() => _OneWayAnimationState();
}

class _OneWayAnimationState extends State<OneWayAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  Duration duration = Duration(
    seconds: 6,
  );

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: duration,
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(animationController)
      ..addListener(() {
        setState(() {
        });
      });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dünyası'),
        centerTitle: true,
      ),
      body: Center(
        child: Transform.rotate(
            angle: animation.value,
            child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('Flutter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )))),
      ),
    );
  }
}
