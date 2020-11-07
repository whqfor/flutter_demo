/*
 * Created with Android Studio.
 * User: whqfor
 * Date: 11/3/20
 * Time: 6:13 PM
 * target: 验证性动画片段主页
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/home_page.dart';

class AnimationDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('AnimationDemos build');
    return HomePage(
      title: 'Simple Animation Example',
      greetingWidget: GreetingText(category: 'Animation'),
      exampleType: ExampleType.animation,
      filePath: 'animation',
    );
  }
}
