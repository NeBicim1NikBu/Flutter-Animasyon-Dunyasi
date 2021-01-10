import 'package:flutter/material.dart';
import 'dart:math' as math;

class SimpleAnimation extends StatefulWidget {
  SimpleAnimation({Key key}) : super(key: key);

  @override
  _SimpleAnimationState createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dünyası'),
        centerTitle: true,
      ),
      body: Center(
        child: Transform.rotate(
          angle: 0,
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Text(
              'Flutter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
