import 'package:flutter/material.dart';
import 'animation_curved.dart';
import 'animation_page.dart';
import 'infinite_loop_animation.dart';
import 'oneway_animation.dart';
import 'simple_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          // AnimationWithCurve(), // Her iki yöne doğru farklı rotaya sahip animasyon
          // InfiniteLoopAnimation(), // Sonsuz tekrarla animasyon
          // OneWayAnimation(), // Saat yönünde tek sefer dönen animasyon
          // SimpleAnimation(), // Angle değişkenini değiştirerek çalışan basit animasyon
          AnimationPage(), // Tüm öğrendiklerinizi birden çok kutuya uygulayabileceğiniz farklı bir animasyon
    );
  }
}
