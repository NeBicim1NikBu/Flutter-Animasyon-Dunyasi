import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  Duration duration = Duration(seconds: 6);
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: duration);

    curvedAnimation = CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
        reverseCurve: Curves.bounceIn);

    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
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
      backgroundColor: Colors.black,
      body: Transform.rotate(
        angle: animation.value / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RotatingAnimation(
              text: 'Flutter',
              animationContainer: animation.value,
              color: Colors.purple,
              animationText: -animation.value / 2,
            ),
            RotatingAnimation(
              text: 'Animasyon',
              animationContainer: animation.value,
              color: Colors.blue,
              animationText: animation.value,
            ),
            RotatingAnimation(
              text: 'Dünyası',
              animationContainer: animation.value,
              color: Colors.orange,
              animationText: -animation.value,
            ),
          ],
        ),
      ),
    );
  }
}

class RotatingAnimation extends StatelessWidget {
  const RotatingAnimation({
    Key key,
    @required this.text,
    @required this.animationContainer,
    @required this.color,
    @required this.animationText,
  }) : super(key: key);

  final double animationContainer;
  final double animationText;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: animationContainer,
            child: Container(
              alignment: Alignment.center,
              color: color,
              width: 130,
              height: 130,
            ),
          ),
          Transform.rotate(
            angle: animationText,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
