import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/animation_home.dart';
import 'package:flutter_demo/widgets/code_home.dart';
import 'package:flutter_demo/widgets/ui_home.dart';

void main() {
  runApp(FlutterDemo());
}

class FlutterDemo extends StatefulWidget {
  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {

  int _currentIndex = 2;
  final List<Widget> tabItemBodies = [CodePieces(), UIStack(), AnimationDemos()];

  _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: 'Code', icon: Icon(Icons.code)),
            BottomNavigationBarItem(label: 'UI', icon: Icon(Icons.view_quilt)),
            BottomNavigationBarItem(label: 'Animation', icon: Icon(Icons.animation)),
          ],
          onTap: _onTap,
          currentIndex: _currentIndex,
        ),
        body: IndexedStack(
            index: _currentIndex,
            children: tabItemBodies
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.touch_app_outlined),
          onPressed: () {

          },
        ),
      ),
    );
  }
}
