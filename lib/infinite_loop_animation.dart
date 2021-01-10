import 'package:flutter/material.dart';
import 'dart:math' as math;

class InfiniteLoopAnimation extends StatefulWidget {
  InfiniteLoopAnimation({Key key}) : super(key: key);

  @override
  _InfiniteLoopAnimationState createState() => _InfiniteLoopAnimationState();
}

class _InfiniteLoopAnimationState extends State<InfiniteLoopAnimation>
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
        setState(() {});
      })..addStatusListener((status) {
        if(status==AnimationStatus.completed){
          animationController.reverse();
        }else if(status==AnimationStatus.dismissed){
          animationController.forward();
        }
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
