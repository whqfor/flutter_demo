/*
 * Created with Android Studio.
 * User: whqfor
 * Date: 1/7/21
 * Time: 4:37 PM
 * target: 一些基本的、容易上手的动画
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/example_page.dart';

class BaseAnimationsDemo extends StatefulWidget {
  @override
  _BaseAnimationsDemoState createState() => _BaseAnimationsDemoState();
}

class _BaseAnimationsDemoState extends State<BaseAnimationsDemo> {
  final random = Random();
  int _animatedContainerValue = 200;

  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),

              AnimatedContainer(
                width: _animatedContainerValue.toDouble(),
                height: _animatedContainerValue.toDouble(),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    random.nextInt(256),
                    random.nextInt(256),
                    random.nextInt(256),
                    1,
                  ),
                  borderRadius:
                      BorderRadius.circular(random.nextInt(100).toDouble()),
                ),
                alignment: Alignment.center,
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                // child: FlutterLogo(size: 75),
              ),

              SizedBox(height: 20),

              // AnimatedContainer
              AnimatedOpacity(
                  opacity: random.nextDouble(),
                  duration: Duration(milliseconds: 300),
                  child: Container(width: 80, height: 80, color: Colors.black)),

              SizedBox(height: 20),

              AnimatedCrossFade(
                  firstChild:
                      Container(width: 80, height: 80, color: Colors.green),
                  secondChild:
                      Container(width: 80, height: 80, color: Colors.red),
                  crossFadeState: _showFirst
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 1000))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.touch_app_outlined),
        onPressed: () {
          setState(() {
            _animatedContainerValue = random.nextInt(256);
            _showFirst = !_showFirst;
          });
        },
      ),
    );
  }
}

class BaseAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: "base animations",
      pathToFile: "animation/base_animations.dart",
      delayStartup: false,
      builder: (context) => BaseAnimationsDemo(),
    );
  }
}
