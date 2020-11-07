/*
 * Created with Android Studio.
 * User: whqfor
 * Date: 11/3/20
 * Time: 6:14 PM
 * target: 验证性UI片段主页
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/home_page.dart';

class UIStack extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('UIStack build');
    return HomePage(
      title: 'Simple UI Example',
      greetingWidget: GreetingText(category: 'UI'),
      exampleType: ExampleType.ui,
      filePath: 'ui',
    );
  }
}